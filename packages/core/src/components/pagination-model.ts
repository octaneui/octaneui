export type PaginationItem =
  | { type: "page"; id: string; page: number }
  | { type: "ellipsis"; id: string };

function range(start: number, end: number): number[] {
  const pages: number[] = [];
  for (let page = start; page <= end; page++) pages.push(page);
  return pages;
}

function pageItem(page: number): PaginationItem {
  return { type: "page", id: String(page), page };
}

/** First, last, and pages around the current page, with ellipses for gaps. */
export function createPaginationItems(
  page: number,
  count: number,
  siblingCount = 1,
): PaginationItem[] {
  if (count < 1) return [];

  const current = Math.min(Math.max(1, page), count);
  const siblings = Math.max(0, siblingCount);
  const totalPageNumbers = siblings * 2 + 5;

  if (totalPageNumbers >= count) return range(1, count).map(pageItem);

  const leftSibling = Math.max(current - siblings, 1);
  const rightSibling = Math.min(current + siblings, count);
  const showLeftEllipsis = leftSibling > 2;
  const showRightEllipsis = rightSibling < count - 1;

  if (!showLeftEllipsis && showRightEllipsis) {
    const leftItemCount = 3 + 2 * siblings;
    return [
      ...range(1, leftItemCount).map(pageItem),
      { type: "ellipsis", id: "right" },
      pageItem(count),
    ];
  }

  if (showLeftEllipsis && !showRightEllipsis) {
    const rightItemCount = 3 + 2 * siblings;
    return [
      pageItem(1),
      { type: "ellipsis", id: "left" },
      ...range(count - rightItemCount + 1, count).map(pageItem),
    ];
  }

  return [
    pageItem(1),
    { type: "ellipsis", id: "left" },
    ...range(leftSibling, rightSibling).map(pageItem),
    { type: "ellipsis", id: "right" },
    pageItem(count),
  ];
}
