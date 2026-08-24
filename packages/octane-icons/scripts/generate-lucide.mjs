// Generates `src/lucide/icons/*`, `src/lucide/icons/index.ts`,
// `src/lucide/aliases.ts`, and `src/lucide/dynamicIconImports.ts` from the
// framework-neutral icon data in `@lucide/icons`. The generated modules
// inline each icon's SVG node data directly, so the published package has
// no runtime dependency on `@lucide/icons`, Lucide's own renderer packages,
// or React.
//
// Run with `bun run generate:lucide`. Pass `--check` to verify the checked-in
// output is current without writing anything (used in CI).

import { createRequire } from "node:module";
import {
  existsSync,
  mkdirSync,
  readFileSync,
  readdirSync,
  rmSync,
  statSync,
  writeFileSync,
} from "node:fs";
import { dirname, join, relative, resolve } from "node:path";
import { fileURLToPath, pathToFileURL } from "node:url";

const require = createRequire(import.meta.url);
const PACKAGE_ROOT = resolve(dirname(fileURLToPath(import.meta.url)), "..");
const SRC_ROOT = join(PACKAGE_ROOT, "src", "lucide");
const ICONS_OUT = join(SRC_ROOT, "icons");
const CHECK = process.argv.includes("--check");
const MIN_EXPECTED_ICONS = 1000;

const SUPPORTED_TAGS = new Set([
  "circle",
  "ellipse",
  "line",
  "path",
  "polygon",
  "polyline",
  "rect",
]);

const entryPath = require.resolve("@lucide/icons");
const packageRoot = resolve(dirname(entryPath), "../..");
const manifestPath = join(packageRoot, "package.json");
const manifest = JSON.parse(readFileSync(manifestPath, "utf8"));
const SOURCE_VERSION = manifest.version;
const iconsSourceDir = join(packageRoot, "dist/esm/icons");

const header =
  `// Generated from @lucide/icons@${SOURCE_VERSION} by \`bun run generate:lucide\`.\n` +
  `// Do not edit by hand — see scripts/generate-lucide.mjs.\n\n`;

function toCamelCase(value) {
  return value.replace(/^([A-Z])|[\s-_]+(\w)/g, (_match, first, following) =>
    following ? following.toUpperCase() : first.toLowerCase(),
  );
}

function toPascalCase(value) {
  const camelCase = toCamelCase(value);
  return camelCase.charAt(0).toUpperCase() + camelCase.slice(1);
}

function formatAttrs(attrs) {
  const entries = Object.entries(attrs).map(([key, value]) => {
    if (typeof value !== "string") {
      throw new Error(
        `Unsupported non-string value for attribute "${key}" (${typeof value})`,
      );
    }
    return `${key}: ${JSON.stringify(value)}`;
  });
  return `{ ${entries.join(", ")} }`;
}

function formatIconNode(node) {
  const lines = node.map((entry) => {
    const [tag, attrs] = entry;
    if (entry.length > 2) {
      throw new Error(`Unsupported nested SVG children on element "${tag}"`);
    }
    if (!SUPPORTED_TAGS.has(tag)) {
      throw new Error(`Unsupported SVG element "${tag}"`);
    }
    return `  [${JSON.stringify(tag)}, ${formatAttrs(attrs)}],`;
  });
  return `[\n${lines.join("\n")}\n]`;
}

// --- Load and validate every canonical icon --------------------------------

const files = readdirSync(iconsSourceDir)
  .filter((name) => name.endsWith(".mjs") && name !== "index.mjs")
  .sort();

if (files.length < MIN_EXPECTED_ICONS) {
  throw new Error(
    `Expected at least ${MIN_EXPECTED_ICONS} canonical Lucide icons, found ${files.length}. ` +
      "Refusing to generate from a possibly broken @lucide/icons install.",
  );
}

const canonical = [];
const kebabByPascal = new Map();

for (const file of files) {
  const kebabName = file.slice(0, -4);
  const moduleUrl = pathToFileURL(join(iconsSourceDir, file)).href;
  const { default: data } = await import(moduleUrl);

  if (data.name !== kebabName) {
    throw new Error(
      `Icon file "${file}" declares name "${data.name}", expected "${kebabName}"`,
    );
  }
  if (!Array.isArray(data.node) || data.node.length === 0) {
    throw new Error(`Icon "${kebabName}" has no SVG node data`);
  }

  const pascalName = toPascalCase(kebabName);
  const collidingKebab = kebabByPascal.get(pascalName);
  if (collidingKebab) {
    throw new Error(
      `Icon name collision: "${kebabName}" and "${collidingKebab}" both produce component name "${pascalName}"`,
    );
  }
  kebabByPascal.set(pascalName, kebabName);

  canonical.push({
    kebabName,
    pascalName,
    node: data.node,
    aliases: data.aliases ?? [],
  });
}

canonical.sort((a, b) =>
  a.kebabName < b.kebabName ? -1 : a.kebabName > b.kebabName ? 1 : 0,
);

// --- Build expected file contents -------------------------------------------

const expected = new Map();

for (const icon of canonical) {
  expected.set(
    join(ICONS_OUT, `${icon.kebabName}.ts`),
    header +
      `import createLucideIcon from "../createLucideIcon";\n` +
      `import type { IconNode } from "../types";\n\n` +
      `export const iconNode: IconNode = ${formatIconNode(icon.node)};\n\n` +
      `const ${icon.pascalName} = createLucideIcon(${JSON.stringify(icon.kebabName)}, iconNode);\n\n` +
      `export default ${icon.pascalName};\n`,
  );
}

expected.set(
  join(ICONS_OUT, "index.ts"),
  header +
    canonical
      .map(
        (icon) =>
          `export { default as ${icon.pascalName} } from "./${icon.kebabName}";`,
      )
      .join("\n") +
    "\n",
);

// Aliases point named exports at their canonical icon's module so alias
// consumers still get a single shared component (and identical DOM output).
const aliasLines = [];
const aliasPascalOwners = new Map(kebabByPascal);

for (const icon of canonical) {
  for (const aliasKebab of icon.aliases) {
    const aliasPascal = toPascalCase(aliasKebab);
    const owner = aliasPascalOwners.get(aliasPascal);
    if (owner && owner !== icon.kebabName) {
      throw new Error(
        `Alias name collision: "${aliasKebab}" (alias of "${icon.kebabName}") already resolves to "${owner}"`,
      );
    }
    aliasPascalOwners.set(aliasPascal, icon.kebabName);
    aliasLines.push(
      `export { default as ${aliasPascal} } from "./icons/${icon.kebabName}";`,
    );
  }
}

expected.set(
  join(SRC_ROOT, "aliases.ts"),
  header + (aliasLines.length ? aliasLines.join("\n") + "\n" : ""),
);

// Dynamic import map covers canonical names and aliases, always resolving to
// the canonical icon's module (mirroring how `@lucide/icons` dedupes them).
const dynamicEntries = [];
for (const icon of canonical) {
  dynamicEntries.push({ name: icon.kebabName, target: icon.kebabName });
  for (const aliasKebab of icon.aliases) {
    dynamicEntries.push({ name: aliasKebab, target: icon.kebabName });
  }
}
dynamicEntries.sort((a, b) => (a.name < b.name ? -1 : a.name > b.name ? 1 : 0));

expected.set(
  join(SRC_ROOT, "dynamicIconImports.ts"),
  header +
    `const dynamicIconImports = {\n` +
    dynamicEntries
      .map(
        ({ name, target }) =>
          `  ${JSON.stringify(name)}: () => import("./icons/${target}"),`,
      )
      .join("\n") +
    `\n} as const;\n\n` +
    `export type IconName = keyof typeof dynamicIconImports;\n\n` +
    `export default dynamicIconImports;\n`,
);

// --- Write or check ----------------------------------------------------------

function walk(directory) {
  if (!existsSync(directory)) return [];
  const results = [];
  for (const name of readdirSync(directory)) {
    const path = join(directory, name);
    if (statSync(path).isDirectory()) results.push(...walk(path));
    else results.push(path);
  }
  return results;
}

if (CHECK) {
  const problems = [];
  for (const [path, contents] of expected) {
    if (!existsSync(path)) {
      problems.push(`missing ${relative(PACKAGE_ROOT, path)}`);
    } else if (readFileSync(path, "utf8") !== contents) {
      problems.push(`stale ${relative(PACKAGE_ROOT, path)}`);
    }
  }
  for (const path of walk(ICONS_OUT)) {
    if (!expected.has(path)) {
      problems.push(`unexpected ${relative(PACKAGE_ROOT, path)}`);
    }
  }
  if (problems.length) {
    console.error(
      `Lucide generated sources are not current:\n- ${problems.join("\n- ")}`,
    );
    process.exit(1);
  }
  console.log(
    `Lucide generated sources are current (${canonical.length} icons, ${dynamicEntries.length} dynamic names, @lucide/icons@${SOURCE_VERSION}).`,
  );
} else {
  rmSync(ICONS_OUT, { recursive: true, force: true });
  mkdirSync(ICONS_OUT, { recursive: true });
  for (const [path, contents] of expected) {
    mkdirSync(dirname(path), { recursive: true });
    writeFileSync(path, contents);
  }
  console.log(
    `Generated ${canonical.length} Lucide icons and ${dynamicEntries.length - canonical.length} aliases ` +
      `from @lucide/icons@${SOURCE_VERSION}.`,
  );
}
