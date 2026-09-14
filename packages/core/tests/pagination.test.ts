import { describe, it } from "node:test";
import assert from "node:assert/strict";
import {
  createPaginationItems,
  type PaginationItem,
} from "../src/components/pagination-model.ts";

function labels(items: PaginationItem[]) {
  return items.map((item) => item.type === "page" ? item.page : "…");
}

describe("Pagination items", () => {
  it("returns no items when there are no pages", () => {
    assert.deepEqual(createPaginationItems(1, 0), []);
    assert.deepEqual(createPaginationItems(1, -3), []);
  });

  it("lists every page when they fit beside the first and last", () => {
    assert.deepEqual(labels(createPaginationItems(1, 1)), [1]);
    assert.deepEqual(labels(createPaginationItems(3, 7)), [1, 2, 3, 4, 5, 6, 7]);
  });

  it("keeps first and last pages visible and inserts ellipses for gaps", () => {
    assert.deepEqual(
      labels(createPaginationItems(1, 10)),
      [1, 2, 3, 4, 5, "…", 10],
    );
    assert.deepEqual(
      labels(createPaginationItems(5, 10)),
      [1, "…", 4, 5, 6, "…", 10],
    );
    assert.deepEqual(
      labels(createPaginationItems(10, 10)),
      [1, "…", 6, 7, 8, 9, 10],
    );
  });

  it("clamps the current page and honors siblingCount", () => {
    assert.deepEqual(
      labels(createPaginationItems(0, 10)),
      [1, 2, 3, 4, 5, "…", 10],
    );
    assert.deepEqual(
      labels(createPaginationItems(99, 10)),
      [1, "…", 6, 7, 8, 9, 10],
    );
    assert.deepEqual(
      labels(createPaginationItems(5, 10, 0)),
      [1, "…", 5, "…", 10],
    );
  });
});
