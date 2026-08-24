# octane-icons

Framework-native icon packages for [Octane](https://octanejs.dev), generated
from upstream icon sets. Each family ships as its own subpath (starting with
`octane-icons/lucide`) so future sets can be added without collisions.

Icons are plain Octane components: no React, no Lucide runtime, and no
`@lucide/icons` dependency ship in the published package. Each icon's SVG
node data is inlined at generation time — `@lucide/icons` is only used by the
code generator, as a dev dependency.

## Install

```bash
bun add octane-icons
```

## Usage

Named icons are tree-shakeable and accept familiar Lucide presentation props:

```tsrx
import { Camera, CircleAlert } from "octane-icons/lucide";

export function Toolbar() @{
  <nav>
    <Camera size={20} strokeWidth={1.5} aria-label="Camera" />
    <CircleAlert color="tomato" absoluteStrokeWidth />
  </nav>
}
```

Provider defaults and per-icon deep imports are supported:

```tsrx
import { Camera } from "octane-icons/lucide/icons/camera";
import { LucideProvider } from "octane-icons/lucide";

export function App() @{
  <LucideProvider color="rebeccapurple" strokeWidth={1.5}>
    <Camera />
  </LucideProvider>
}
```

`DynamicIcon` resolves an icon by name at runtime via a lazy, code-split
import — intended for client-only, interactive use (search/browse UIs) since
it loads icon data with `useState`/`useEffect` after mount:

```tsrx
import { DynamicIcon } from "octane-icons/lucide/dynamic";

export function IconPreview({ name }: { name: string }) @{
  <DynamicIcon name={name} fallback={() => <span>…</span>} />
}
```

## Props

Every icon accepts:

| Prop | Type | Default | Notes |
| --- | --- | --- | --- |
| `size` | `string \| number` | `24` | Sets both `width` and `height`. |
| `color` | `string` | `currentColor` | Sets `stroke`. |
| `strokeWidth` | `string \| number` | `2` | |
| `absoluteStrokeWidth` | `boolean` | `false` | Keeps visual stroke weight constant across sizes. |
| `class` / `className` | `ClassValue` | — | Merged with the generated `lucide lucide-<name>` classes. |
| `ref` | `IconRef` | — | Ref to the underlying `<svg>`. |

Set shared defaults for a subtree with `LucideProvider`.

## Regenerating

The `lucide` family is generated from `@lucide/icons` (pinned as a dev
dependency). To refresh it after bumping that dependency:

```bash
bun run generate:lucide
```

`bun run generate:lucide:check` verifies the checked-in output is current
without writing anything (used in CI).

## License

Lucide icon geometry is ISC licensed by Lucide Icons and Contributors, with
some icons additionally MIT licensed via the Feather project. See
[`LICENSE`](./LICENSE) for the full text.
