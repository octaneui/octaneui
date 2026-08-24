import type { OctaneNode } from "octane";
import type { Octane } from "octane/jsx-runtime";

type DisclosureNativeProps = Omit<
  Octane.DetailsHTMLAttributes<HTMLDetailsElement>,
  "className"
>;

export interface DisclosureProps extends DisclosureNativeProps {
  summary: OctaneNode;
}

export function Disclosure({
  summary,
  children,
  style,
  ...rest
}: DisclosureProps) @{
  <details {...rest} class={["root", rest.class]} style={style}>
    <summary class="summary">{summary}</summary>
    <div class="body">{children}</div>

    <style>
      .root {
        --disclosure-chevron: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3E%3Cpath fill='none' stroke='black' stroke-width='1.5' stroke-linecap='round' stroke-linejoin='round' d='M6 4l4 4-4 4'/%3E%3C/svg%3E");
        box-sizing: border-box;
        width: 100%;
        border: 1px solid var(--control-border);
        border-radius: var(--radius, 0.625rem);
        background: var(--control-bg);
        color: var(--control-text);
      }
      .summary {
        display: flex;
        align-items: center;
        gap: var(--control-gap, 0.5rem);
        min-height: var(--control-height, 2.25rem);
        padding: 0.35rem var(--control-pad-x, 0.75rem);
        font-size: var(--control-font-size, 0.9375rem);
        font-weight: 600;
        cursor: pointer;
        list-style: none;
        user-select: none;
      }
      .summary::-webkit-details-marker {
        display: none;
      }
      .summary::before {
        content: "";
        flex-shrink: 0;
        width: 1rem;
        height: 1rem;
        background-color: var(--control-muted);
        mask: var(--disclosure-chevron) center / 1rem no-repeat;
        transition: rotate 0.15s ease;
      }
      .root[open] > .summary::before {
        rotate: 90deg;
      }
      .summary:focus-visible {
        outline: none;
        box-shadow: var(--control-ring);
        border-radius: inherit;
      }
      .body {
        padding: 0 var(--control-pad-x, 0.75rem) 0.85rem;
        color: var(--control-muted);
        font-size: var(--control-font-size, 0.9375rem);
        line-height: 1.5;
      }
    </style>
  </details>
}
