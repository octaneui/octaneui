# @octaneui/core

UI components and styles for [Octane](https://octanejs.dev). Components wrap native HTML elements rather than rebuilding them, keeping the surface small and familiar.

Docs and examples: [octaneui.dev](https://octaneui.dev)

## Install

```sh
bun add @octaneui/core
```

Import the stylesheet once in your app:

```ts
import "@octaneui/core/styles.css";
```

## Datagrid

Import `Datagrid` and `DatagridColumnDef` from `@octaneui/core` or
`@octaneui/core/datagrid`. Pass `columnDefs`, `data`, and a stable `getRowId`.
Nested column `children` create groups; leaf `size` accepts a CSS Grid track
size, and `pin: "left" | "right"` pins columns or groups to either edge.
All rows are rendered with native table semantics and CSS Grid/Subgrid.

See the [Datagrid docs](https://octaneui.dev/components/datagrid) for examples
and the [roadmap](./DATAGRID_TODO.md) for planned features.

Run column-model tests with `bun run test` from this package.
