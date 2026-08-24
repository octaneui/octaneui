import { readFile } from "node:fs/promises";
import { dirname, resolve } from "node:path";
import type { Plugin } from "vite";
import { createHighlighter, type Highlighter, type LanguageInput } from "shiki";

const HIGHLIGHT_SUFFIX = "?highlight";
const VIRTUAL_PREFIX = "\0octane-ui:highlight:";

// TSRX is TypeScript + JSX with a small set of template directives. Shiki does
// not ship a TSRX language yet, so layer those directives over its bundled TSX
// grammar. Keeping this compact also avoids copying Ripple's full grammar into
// this repository.
const tsrxLanguage: LanguageInput = {
  name: "tsrx",
  aliases: ["TSRX"],
  scopeName: "source.tsrx",
  embeddedLangs: ["tsx", "css"],
  patterns: [
    { include: "#tsrx-directives" },
    { include: "source.tsx" },
  ],
  repository: {
    "tsrx-directives": {
      patterns: [
        {
          name: "keyword.control.tsrx",
          match:
            "@(?:if|else|for|empty|switch|case|default|try|pending|catch)(?=\\s|\\()",
        },
        {
          name: "keyword.operator.tsrx",
          match: "@(?=\\{)",
        },
      ],
    },
  },
};

let highlighterPromise: Promise<Highlighter> | undefined;

function getHighlighter() {
  highlighterPromise ??= createHighlighter({
    themes: ["github-light", "github-dark-high-contrast"],
    langs: ["tsx", "css", tsrxLanguage],
  });
  return highlighterPromise;
}

export function tsrxHighlight(): Plugin {
  return {
    name: "octane-ui-tsrx-highlight",
    enforce: "pre",

    resolveId(source, importer) {
      if (!source.endsWith(HIGHLIGHT_SUFFIX) || !importer) return null;

      const sourcePath = source.slice(0, -HIGHLIGHT_SUFFIX.length);
      return VIRTUAL_PREFIX + resolve(dirname(importer), sourcePath);
    },

    async load(id) {
      if (!id.startsWith(VIRTUAL_PREFIX)) return null;

      const filename = id.slice(VIRTUAL_PREFIX.length);
      const source = (await readFile(filename, "utf8")).trim();
      const highlighter = await getHighlighter();
      const html = highlighter.codeToHtml(source, {
        lang: "tsrx",
        themes: {
          light: "github-light",
          dark: "github-dark-high-contrast",
        },
        defaultColor: false,
      });

      return `export default ${JSON.stringify(html)};`;
    },
  };
}
