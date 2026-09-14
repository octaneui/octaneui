import { describe, it } from "node:test";
import assert from "node:assert/strict";
import {
  createDatagridModel,
  datagridCellValue,
  datagridPinStyle,
  type DatagridColumnDef,
} from "../src/components/datagrid-model.ts";

interface Row {
  name: string;
  count: number;
}

describe("Datagrid column model", () => {
  it("preserves CSS track sizes without interpreting CSS units", () => {
    const sizes = [
      "12px",
      "8rem",
      "20%",
      "2fr",
      "auto",
      "min-content",
      "max-content",
      "minmax(8ch, 1fr)",
      "fit-content(15vw)",
      "calc(10rem + 2px)",
      "var(--column-width)",
    ];
    const model = createDatagridModel(
      sizes.map((size, index) => ({
        id: String(index),
        header: String(index),
        size,
      })),
      "grid",
    );
    assert.equal(model.template, sizes.join(" "));
    assert.equal(
      createDatagridModel([{ id: "default", header: "Default" }], "grid")
        .template,
      "minmax(0, 1fr)",
    );
  });

  it("orders pins stably and splits groups while preserving header associations", () => {
    const defs: DatagridColumnDef<Row>[] = [
      {
        id: "group",
        header: "Group",
        children: [
          { id: "a", header: "A" },
          { id: "b", header: "B", pin: "right" },
          { id: "c", header: "C", pin: "left" },
          { id: "d", header: "D" },
        ],
      },
      { id: "e", header: "E", pin: "left" },
      { id: "f", header: "F", pin: "right" },
    ];
    const model = createDatagridModel(defs, "one");
    assert.deepEqual(
      model.columns.map((leaf) => leaf.column.id),
      ["c", "e", "a", "d", "b", "f"],
    );
    const groups = model.headerRows[0].filter((header) => !header.leaf);
    assert.deepEqual(
      groups.map((header) => [header.start, header.span, header.pin]),
      [
        [0, 1, "left"],
        [2, 2, undefined],
        [4, 1, "right"],
      ],
    );
    assert.equal(model.columns[2].headers[0], model.columns[3].headers[0]);
    assert.notEqual(model.columns[0].headers[0], model.columns[2].headers[0]);
    const ids = model.headerRows.flat().map((header) => header.id);
    assert.equal(new Set(ids).size, ids.length);
    for (const leaf of model.columns) {
      assert.equal(leaf.headers.length, leaf.ancestors.length + 1);
      for (const id of leaf.headers) assert.ok(ids.includes(id));
    }
    assert.deepEqual(
      defs[0].children?.map((column) => column.id),
      ["a", "b", "c", "d"],
    );
  });

  it("spans shallow headers through deeper levels and inherits group pins", () => {
    const model = createDatagridModel(
      [
        { id: "plain", header: "Plain" },
        {
          id: "group",
          header: "Group",
          pin: "left",
          children: [
            { id: "shallow", header: "Shallow" },
            {
              id: "nested",
              header: "Nested",
              children: [
                { id: "deep", header: "Deep" },
                { id: "override", header: "Override", pin: "right" },
              ],
            },
          ],
        },
      ],
      "grid",
    );
    assert.equal(model.headerRows.length, 3);
    assert.deepEqual(
      model.columns.map((leaf) => [leaf.column.id, leaf.pin]),
      [
        ["shallow", "left"],
        ["deep", "left"],
        ["plain", undefined],
        ["override", "right"],
      ],
    );
    assert.equal(
      model.headerRows[0].find((header) => header.content === "Plain")?.rowSpan,
      3,
    );
    assert.equal(
      model.headerRows[1].find((header) => header.content === "Shallow")
        ?.rowSpan,
      2,
    );
    assert.equal(model.columns[1].headers.length, 3);
  });

  it("keeps adjacent distinct groups separate and namespaces multiple grids", () => {
    const defs = [
      { id: "a", header: "Same", children: [{ id: "a1", header: "Leaf" }] },
      { id: "b", header: "Same", children: [{ id: "b1", header: "Leaf" }] },
    ];
    const first = createDatagridModel(defs, "first");
    const second = createDatagridModel(defs, "second");
    assert.equal(first.headerRows[0].length, 2);
    assert.notEqual(first.columns[0].headers[0], second.columns[0].headers[0]);
  });

  it("rejects ambiguous definitions and handles no columns", () => {
    assert.throws(
      () => createDatagridModel([{ id: "", header: "Empty" }], "grid"),
      /unique/,
    );
    assert.throws(
      () =>
        createDatagridModel(
          [
            {
              id: "same",
              header: "Group",
              children: [{ id: "same", header: "Leaf" }],
            },
          ],
          "grid",
        ),
      /unique/,
    );
    assert.throws(
      () =>
        createDatagridModel(
          [{ id: "empty", header: "Group", children: [] }],
          "grid",
        ),
      /contain columns/,
    );
    assert.equal(createDatagridModel([], "grid").columns.length, 0);
  });

  it("uses the outer edge of a group fragment for sticky offsets", () => {
    assert.deepEqual(datagridPinStyle("left", 2, 3), {
      left: "var(--datagrid-left-2, 0px)",
    });
    assert.deepEqual(datagridPinStyle("right", 2, 3), {
      right: "var(--datagrid-right-4, 0px)",
    });
    assert.deepEqual(datagridPinStyle(undefined, 0), {});
  });

  it("supports fields, derived values, and empty display columns", () => {
    const row = { name: "Alex", count: 0 };
    assert.equal(
      datagridCellValue(row, { id: "count", header: "Count", field: "count" }),
      0,
    );
    assert.equal(
      datagridCellValue(row, {
        id: "derived",
        header: "Derived",
        field: "count",
        value: (person) => person.name.toUpperCase(),
      }),
      "ALEX",
    );
    assert.equal(
      datagridCellValue(row, { id: "actions", header: "Actions" }),
      undefined,
    );
  });
});
