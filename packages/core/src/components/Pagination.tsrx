import { useState } from "octane";
import type { OctaneNode } from "octane";
import type { Octane } from "octane/jsx-runtime";
import { ChevronLeft, ChevronRight } from "@octaneui/icons/lucide";
import { createPaginationItems } from "./pagination-model.ts";

type NavProps = Omit<Octane.HTMLAttributes<HTMLElement>, "className" | "children">;

export interface PaginationProps extends NavProps {
  /** Total number of pages. */
  count: number;
  page?: number;
  defaultPage?: number;
  onPageChange?: (page: number) => void;
  /** Page numbers on each side of the current page. Default 1. */
  siblingCount?: number;
  previous?: OctaneNode;
  next?: OctaneNode;
}

export function Pagination({
  count,
  page,
  defaultPage,
  onPageChange,
  siblingCount = 1,
  previous,
  next,
  ...rest
}: PaginationProps) @{
  const [selection, setSelection] = useState(defaultPage ?? page ?? 1);
  const pageCount = Math.max(0, count);
  const current = pageCount < 1
    ? 1
    : Math.min(Math.max(1, page ?? selection), pageCount);
  const items = createPaginationItems(current, pageCount, siblingCount);

  function select(nextPage: number) {
    const clamped = pageCount < 1
      ? 1
      : Math.min(Math.max(1, nextPage), pageCount);
    if (clamped === current) return;
    if (page === undefined) setSelection(clamped);
    onPageChange?.(clamped);
  }

  <nav
    {...rest}
    class={["root", rest.class]}
    aria-label={rest["aria-label"] ??
      (rest["aria-labelledby"] ? undefined : "Pagination")}
  >
    <ul class="list">
      <li>
        <button
          type="button"
          class="item"
          aria-label={typeof previous === "string" ? undefined : "Previous page"}
          disabled={current <= 1}
          onClick={() => select(current - 1)}
        >
          {previous ?? <ChevronLeft size={16} aria-hidden="true" />}
        </button>
      </li>
      @for (const item of items; key item.id) {
        <li>
          {item.type === "ellipsis"
            ? <span class="ellipsis" aria-hidden="true">…</span>
            : (
              <button
                type="button"
                class="item"
                aria-label={`Page ${item.page}`}
                aria-current={item.page === current ? "page" : undefined}
                onClick={() => select(item.page)}
              >{item.page}</button>
            )}
        </li>
      }
      <li>
        <button
          type="button"
          class="item"
          aria-label={typeof next === "string" ? undefined : "Next page"}
          disabled={current >= pageCount}
          onClick={() => select(current + 1)}
        >
          {next ?? <ChevronRight size={16} aria-hidden="true" />}
        </button>
      </li>
    </ul>

    <style>
      .root {
        min-width: 0;
      }
      .list {
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        gap: 0.25rem;
        margin: 0;
        padding: 0;
        list-style: none;
      }
      .item {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        box-sizing: border-box;
        min-width: var(--control-height);
        min-height: var(--control-height);
        padding: 0.35rem var(--control-padding-inline);
        border: 1px solid transparent;
        border-radius: var(--border-radius);
        background: transparent;
        color: var(--text-secondary);
        font: inherit;
        font-size: var(--control-font-size);
        line-height: 1;
        cursor: pointer;
      }
      .item:hover:not(:disabled) {
        background: var(--control-background-active);
        color: var(--control-text-primary);
      }
      .item[aria-current="page"] {
        background: var(--control-background-active);
        color: var(--control-text-primary);
        font-weight: 600;
      }
      .item:focus-visible {
        outline: 2px solid var(--control-accent);
        outline-offset: 1px;
      }
      .item:disabled {
        opacity: 0.55;
        cursor: not-allowed;
      }
      .item :where(svg) {
        display: block;
        width: 1rem;
        height: 1rem;
      }
      .ellipsis {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-width: var(--control-height);
        min-height: var(--control-height);
        color: var(--text-secondary);
        font-size: var(--control-font-size);
        line-height: 1;
        user-select: none;
      }
      @media (forced-colors: active) {
        .item[aria-current="page"] {
          border-color: Highlight;
        }
        .item:focus-visible {
          outline-color: Highlight;
        }
      }
    </style>
  </nav>
}
