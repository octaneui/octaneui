# Datagrid roadmap

Keep rendering all rows with native table semantics and CSS Grid/Subgrid. No virtualization is planned. Stable row and column IDs, a separate column/header model, and cell renderers form the extension points.

- [ ] **Async data — demo first.** Fetch in the parent and replace `data`; demonstrate loading, errors, cancellation/stale responses, retry, and `aria-busy`. Consider a loading slot only if repeated usage warrants it. Prefer pagination for large datasets.
- [ ] **Column filtering.** The docs already demonstrate parent-controlled filtering. Add per-column filter controls, typed filter state, clear/reset, and server-side filtering examples; define how filters combine before adding a built-in filtering model.
- [ ] **Column resizing.** Controlled size overrides, min/max limits, pointer capture, keyboard-operable resize handles, reset, and persistence. Define how dragging converts a flexible/intrinsic CSS size to an explicit size. Reuse measured pin offsets.
- [ ] **Column and row spanning.** Grouped header spans are implemented. Add body-cell spans with collision validation, explicit covered-cell handling, header associations, and defined behavior at pin boundaries. Row spanning will need body row subgrids or another accessible shared placement strategy.
- [ ] **Details rows.** An expansion renderer and controlled expanded IDs, accessible disclosure buttons, full-width content, and stable state across sorting/filtering.
- [ ] **Row grouping.** A row model for group/aggregate rows and expansion, with explicit accessibility semantics and stable IDs. Decide how grouping interacts with sorting, filtering, details, and spanning.
- [ ] **Row pinning at top/bottom.** Controlled pinned IDs, sticky offsets for variable row heights, opaque backgrounds, and intersection layering with pinned columns. Define whether pinned rows participate in filtering/sorting and ensure rows appear only once.
- [ ] **Sorting.** Parent-controlled sorting is demonstrated. Add column header sort controls, `aria-sort`, comparators, controlled sort state, and a server-side example. Decide on multi-column sorting and null ordering.
- [ ] **Cell editing.** Controlled edit state and editor renderers, commit/cancel, validation, async saves, and focus restoration. Simple always-visible input cells can be demonstrated through `cell` today.
- [ ] **Cell selection.** Define controlled cell/range selection, keyboard navigation, copying, and interaction with text selection and embedded controls. An interactive grid mode requires a complete ARIA grid keyboard contract; preserve the default native table mode.
- [ ] **Accessibility validation.** Manual VoiceOver/Safari and NVDA/Firefox checks for nested and split headers, zoom, keyboard scrolling, and embedded controls. Repeat when adding interactive features.
- [ ] **Pinning refinements.** Define an adaptive policy when pinned columns consume the entire viewport; test physical left/right pins with RTL content, print layouts, and focus scrolling behind pinned cells.
