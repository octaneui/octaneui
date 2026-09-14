import { useId, useLayoutEffect, useRef } from "octane";
import type { OctaneNode } from "octane";
import type { Octane } from "octane/jsx-runtime";
import {
  createDatagridModel,
  datagridCellValue,
  datagridPinStyle,
} from "./datagrid-model.ts";
import type { DatagridColumnDef } from "./datagrid-model.ts";

export type { DatagridColumnDef, DatagridColumn, DatagridColumnGroup, DatagridCellContext, DatagridPin } from "./datagrid-model.ts";

export interface DatagridProps<T> extends Omit<
  Octane.TableHTMLAttributes<HTMLTableElement>,
  "className" | "children"
> {
  columnDefs: readonly DatagridColumnDef<T>[];
  data: readonly T[];
  /** Stable identity preserves custom cell state when rows move or update. */
  getRowId: (row: T) => string | number;
  caption?: OctaneNode;
  emptyContent?: OctaneNode;
}

export function Datagrid<T>({
  columnDefs,
  data,
  getRowId,
  caption,
  emptyContent = "No rows to display.",
  style,
  ...rest
}: DatagridProps<T>) @{
  const id = useId();
  const tableRef = useRef<HTMLTableElement | null>(null);
  const model = createDatagridModel(columnDefs, id);
  const rows = data.map(
    (row, rowIndex) => ({ row, rowIndex, id: getRowId(row) }),
  );

  useLayoutEffect(() => {
    const table = tableRef.current;
    if (!table || !model.columns.some((column) => column.pin)) return;
    const cells = Array.from(
      table.querySelectorAll<HTMLElement>("[data-datagrid-track]"),
    );
    function measure() {
      if (!table) return;
      const widths = new Map(cells.map(
        (cell) => [
          Number(cell.dataset.datagridTrack),
          cell.getBoundingClientRect().width,
        ],
      ));
      let left = 0;
      let right = 0;
      for (let index = 0; index < model.columns.length; index++) {
        table.style.setProperty(`--datagrid-left-${index}`, `${left}px`);
        if (model.columns[index].pin === "left") left += widths.get(index) ?? 0;
      }
      for (let index = model.columns.length - 1; index >= 0; index--) {
        table.style.setProperty(`--datagrid-right-${index}`, `${right}px`);
        if (model.columns[index].pin === "right") right += widths.get(index) ??
          0;
      }
    }
    measure();
    const observer = new ResizeObserver(measure);
    for (const cell of cells) observer.observe(cell);
    return () => observer.disconnect();
  }, [columnDefs]);

  <div
    class={["root", rest.class]}
    style={style}
    tabIndex={0}
    role="region"
    aria-label={rest["aria-label"] ??
      (caption ? undefined : "Scrollable data table")}
    aria-labelledby={rest["aria-labelledby"] ??
      (caption ? `${id}-caption` : undefined)}
  >
    <table
      {...rest}
      ref={tableRef}
      class="table"
      role="table"
      style={{ gridTemplateColumns: model.template }}
    >
      @if (caption) {
        <caption id={`${id}-caption`} class="caption">
          <div class="caption-content">{caption}</div>
        </caption>
      }
      <thead
        role="rowgroup"
        class="head"
        style={{ gridTemplateRows: `repeat(${model.headerRows.length}, auto)` }}
      >
        @for (const [level, headers] of Array.from(
          model.headerRows.entries(),
        ); key level) {
          <tr
            role="row"
            class="header-row"
            style={{ gridRow: `${level + 1} / -1` }}
          >
            @for (const header of headers; key header.id) {
              <th
                role="columnheader"
                id={header.id}
                colspan={header.span}
                rowspan={header.rowSpan}
                scope={header.leaf ? "col" : undefined}
                class="cell header"
                data-pin={header.pin}
                data-divider={header.start > 0 &&
                model.columns[header.start - 1].pin !== "left"
                  ? "left"
                  : undefined}
                data-datagrid-track={header.leaf ? header.start : undefined}
                style={{
                  gridColumn: `${header.start + 1} / span ${header.span}`,
                  gridRow: `1 / span ${header.rowSpan}`,
                  textAlign: header.align,
                  ...datagridPinStyle(header.pin, header.start, header.span),
                }}
              >{header.content}</th>
            }
          </tr>
        }
      </thead>
      <tbody role="rowgroup" class="body">
        @if (model.columns.length && rows.length) {
          @for (const item of rows; key item.id) {
            <tr role="row" class="row">
              @for (const [index, leaf] of Array.from(
                model.columns.entries(),
              ); key leaf.column.id) {
                <td
                  role="cell"
                  headers={leaf.headers.join(" ")}
                  class="cell"
                  data-pin={leaf.pin}
                  data-divider={index > 0 &&
                  model.columns[index - 1].pin !== "left"
                    ? "left"
                    : undefined}
                  style={{
                    gridColumn: index + 1,
                    textAlign: leaf.column.align,
                    ...datagridPinStyle(leaf.pin, index),
                  }}
                >
                  {leaf.column.cell
                    ? leaf.column.cell({
                        row: item.row,
                        rowIndex: item.rowIndex,
                        column: leaf.column,
                        value: datagridCellValue(item.row, leaf.column),
                      })
                    : String(datagridCellValue(item.row, leaf.column) ?? "")}
                </td>
              }
            </tr>
          }
        } @else {
          <tr role="row" class="row">
            <td
              role="cell"
              colspan={Math.max(1, model.columns.length)}
              class="cell empty"
            >{emptyContent}</td>
          </tr>
        }
      </tbody>
    </table>
    <style>
      .root {
        box-sizing: border-box;
        width: 100%;
        min-width: 0;
        overflow: auto;
        container-type: inline-size;
        isolation: isolate;
        border: 1px solid var(--control-border);
        border-radius: var(--border-radius);
        background: var(--control-background);
        color: var(--control-text-primary);
        font-size: var(--control-font-size);
      }
      .root:focus-visible {
        outline: 2px solid var(--control-accent);
        outline-offset: 2px;
      }
      .table {
        display: grid;
        width: 100%;
        border-spacing: 0;
        text-align: start;
      }
      .head,
      .body,
      .row,
      .header-row {
        display: grid;
        grid-column: 1 / -1;
        grid-template-columns: subgrid;
        min-width: 0;
      }
      .header-row {
        grid-template-rows: subgrid;
        pointer-events: none;
      }
      .caption {
        grid-column: 1 / -1;
        min-width: 0;
        text-align: start;
      }
      .caption-content {
        position: sticky;
        left: 0;
        box-sizing: border-box;
        width: 100cqi;
        max-width: 100%;
        padding: 0.75rem var(--control-padding-inline);
        font-weight: 600;
        text-align: start;
        overflow-wrap: break-word;
      }
      .cell {
        box-sizing: border-box;
        /* Preserve the intrinsic minimum of auto/fit-content tracks. */
        min-width: auto;
        min-height: var(--control-height);
        padding: 0.65rem var(--control-padding-inline);
        border: 0;
        border-bottom: 1px solid var(--control-border);
        background: var(--control-background);
        overflow-wrap: break-word;
        align-content: center;
      }
      .header {
        background: var(--datagrid-header-background);
        font-weight: 600;
        text-align: start;
        pointer-events: auto;
      }
      .cell[data-pin] {
        position: sticky;
        z-index: 1;
      }
      .header[data-pin] {
        z-index: 2;
      }
      .cell[data-pin="left"] {
        border-right: 1px solid var(--control-border);
      }
      /* Left-pinned cells supply their own trailing separator. */
      .cell[data-divider="left"],
      .cell[data-pin="right"] {
        border-left: 1px solid var(--control-border);
      }
      .row:last-child > .cell {
        border-bottom: 0;
      }
      .empty {
        grid-column: 1 / -1;
        color: var(--text-secondary);
        text-align: center;
      }
    </style>
  </div>
}
