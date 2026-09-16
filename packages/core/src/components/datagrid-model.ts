import type { OctaneNode } from "octane";

export type DatagridPin = "left" | "right";

export interface DatagridCellContext<T> {
  row: T;
  rowIndex: number;
  column: DatagridColumn<T>;
  value: unknown;
}

export interface DatagridColumn<T> {
  id: string;
  header: OctaneNode;
  value?: (row: T) => unknown;
  cell?: (context: DatagridCellContext<T>) => OctaneNode;
  /** One CSS Grid track size, e.g. 12rem, 2fr, auto, minmax(), fit-content(). */
  size?: string;
  pin?: DatagridPin;
  align?: "start" | "center" | "end";
  children?: never;
}

export interface DatagridColumnGroup<T> {
  id: string;
  header: OctaneNode;
  children: readonly DatagridColumnDef<T>[];
  /** Inherited by descendants unless a leaf specifies its own pin. */
  pin?: DatagridPin;
}

export type DatagridColumnDef<T> = DatagridColumn<T> | DatagridColumnGroup<T>;

interface Leaf<T> {
  column: DatagridColumn<T>;
  ancestors: DatagridColumnGroup<T>[];
  pin?: DatagridPin;
  headers: string[];
}

export interface DatagridHeader {
  id: string;
  content: OctaneNode;
  start: number;
  span: number;
  rowSpan: number;
  leaf: boolean;
  pin?: DatagridPin;
  align?: "start" | "center" | "end";
}

/** Keeps visual order, DOM order, and header associations in one model. */
export function createDatagridModel<T>(
  defs: readonly DatagridColumnDef<T>[],
  id: string,
) {
  const leaves: Leaf<T>[] = [];
  const ids = new Set<string>();
  function visit(
    columns: readonly DatagridColumnDef<T>[],
    ancestors: DatagridColumnGroup<T>[],
    inheritedPin?: DatagridPin,
  ) {
    for (const column of columns) {
      if (!column.id || ids.has(column.id)) {
        throw new Error(
          "Datagrid column IDs must be nonempty and unique, including groups.",
        );
      }
      ids.add(column.id);
      const pin = column.pin ?? inheritedPin;
      if (column.children !== undefined) {
        if (!column.children.length)
          throw new Error("Datagrid column groups must contain columns.");
        visit(column.children, [...ancestors, column], pin);
      } else {
        leaves.push({ column, ancestors, pin, headers: [] });
      }
    }
  }
  visit(defs, []);
  const columns = [
    ...leaves.filter((column) => column.pin === "left"),
    ...leaves.filter((column) => !column.pin),
    ...leaves.filter((column) => column.pin === "right"),
  ];
  const depth = columns.reduce(
    (max, column) => Math.max(max, column.ancestors.length + 1),
    1,
  );
  const headerRows: DatagridHeader[][] = Array.from(
    { length: depth },
    () => [],
  );
  for (let level = 0; level < depth; level++) {
    for (let start = 0; start < columns.length;) {
      const leaf = columns[start];
      if (level > leaf.ancestors.length) {
        start++;
        continue;
      }
      const group = leaf.ancestors[level];
      let end = start + 1;
      // A group can cross a pin boundary or be separated by reordered columns.
      // Each contiguous fragment gets its own accessible header association.
      if (group) {
        while (
          end < columns.length &&
          columns[end].ancestors[level] === group &&
          columns[end].pin === leaf.pin
        )
          end++;
      }
      const headerId = `${id}-header-${level}-${start}`;
      headerRows[level].push({
        id: headerId,
        content: group ? group.header : leaf.column.header,
        start,
        span: end - start,
        rowSpan: group ? 1 : depth - level,
        leaf: !group,
        pin: leaf.pin,
        align: group ? undefined : leaf.column.align,
      });
      for (let index = start; index < end; index++)
        columns[index].headers.push(headerId);
      start = end;
    }
  }
  return {
    columns,
    headerRows,
    template:
      columns.map(({ column }) => column.size ?? "minmax(0, 1fr)").join(" ") ||
      "1fr",
  };
}

export function datagridCellValue<T>(
  row: T,
  column: DatagridColumn<T>,
): unknown {
  return column.value?.(row);
}

export function datagridPinStyle(
  pin: DatagridPin | undefined,
  start: number,
  span = 1,
) {
  if (!pin) return {};
  return {
    [pin]: `var(--datagrid-${pin}-${pin === "left" ? start : start + span - 1}, 0px)`,
  };
}
