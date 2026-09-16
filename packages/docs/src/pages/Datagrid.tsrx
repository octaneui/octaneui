import { CodeExample } from "../CodeExample.tsrx";
import {
  GroupedDatagridExample,
} from "../examples/GroupedDatagridExample.tsrx";
import {
  ControlledDatagridExample,
} from "../examples/ControlledDatagridExample.tsrx";
import groupedDatagridExampleHtml from "../examples/GroupedDatagridExample.tsrx?highlight";
import controlledDatagridExampleHtml from "../examples/ControlledDatagridExample.tsrx?highlight";

export function DatagridDocs() @{
  <section class="page">
    <h1 class="title">Datagrid</h1>
    <p class="lede">
      A data table built with CSS Grid and Subgrid. Every row stays in the DOM
      for native table navigation, browser search, and text selection.
    </p>
    <h2 class="subtitle">Grouped and pinned columns</h2>
    <p>
      Pass nested
      <code>columnDefs</code>
      using
      <code>children</code>
      for groups. Each leaf's
      <code>size</code>
      is one CSS Grid track size: lengths, percentages,
      <code>fr</code>,
      <code>auto</code>,
      <code>min-content</code>,
      <code>max-content</code>,
      <code>minmax()</code>, or
      <code>fit-content()</code>. The default is
      <code>minmax(0, 1fr)</code>. Track lists such as
      <code>repeat()</code>
      belong in separate column definitions.
    </p>
    <p>
      Set
      <code>pin: "left"</code>
      or
      <code>pin: "right"</code>
      on a column or group. Pinned columns move to their edge, preserving order
      within each region. Groups split at region boundaries. Scroll horizontally
      below to keep ID, name, and salary visible. Measured sticky offsets follow
      changes in content, fonts, and available width.
    </p>
    <div class="preview">
      <GroupedDatagridExample />
    </div>
    <CodeExample
      filename="GroupedDatagridExample.tsrx"
      html={groupedDatagridExampleHtml}
    />
    <h2 class="subtitle">Controlled data</h2>
    <p>
      Update
      <code>data</code>
      to filter, sort, paginate, or display fetched results. This example
      filters, sorts, and paginates outside the component. Supply a stable,
      unique
      <code>getRowId</code>
      so custom cells retain their identity.
    </p>
    <div class="preview">
      <ControlledDatagridExample />
    </div>
    <CodeExample
      filename="ControlledDatagridExample.tsrx"
      html={controlledDatagridExampleHtml}
    />
    <h2 class="subtitle">Rendering and accessibility</h2>
    <p>
      Each column needs a unique
      <code>id</code>
      and a
      <code>header</code>. Read a cell value with
      <code>value(row)</code>
      or render custom content with
      <code>cell({"{ row, rowIndex, column, value }"})</code>. Null and
      undefined values render as empty text by default.
    </p>
    <p>
      Give the table a
      <code>caption</code>,
      <code>aria-label</code>, or
      <code>aria-labelledby</code>. The scroll container is keyboard focusable;
      links and controls use normal Tab navigation. Native table elements and
      explicit header associations support grouped headers. There is no
      spreadsheet keyboard mode or virtualization. CSS Subgrid support is
      required. Keep the combined pinned width below the viewport width so the
      scrolling columns remain usable.
    </p>
    <p>
      Native table attributes pass through to the table.
      <code>class</code>
      and
      <code>style</code>
      customize the scroll container, including a maximum height.
      <code>emptyContent</code>
      customizes the empty state.
    </p>
  </section>
}
