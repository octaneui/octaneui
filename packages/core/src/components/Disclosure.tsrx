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
        --disclosure-icon: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3E%3Cpath fill='none' stroke='black' stroke-width='1.5' stroke-linecap='round' stroke-linejoin='round' d='M6 4l4 4-4 4'/%3E%3C/svg%3E");
        box-sizing: border-box;
        width: 100%;
        border: 1px solid var(--oc-control-border);
        border-radius: var(--oc-border-radius);
        background: var(--oc-control-background);
        color: var(--oc-control-text-primary);
      }
      .summary {
        display: flex;
        align-items: center;
        gap: var(--oc-control-gap);
        min-height: var(--oc-control-height);
        padding: 0.35rem var(--oc-control-padding-inline);
        font-size: var(--oc-control-font-size);
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
        background-color: var(--oc-control-text-primary);
        mask: var(--disclosure-icon) center / 1rem no-repeat;
        transition: rotate 0.15s ease;
      }
      .root[open] > .summary::before {
        rotate: 90deg;
      }
      .summary:focus-visible {
        outline: none;
        border-radius: inherit;
      }
      .body {
        padding: 0 var(--oc-control-padding-inline) 0.85rem;
        color: var(--oc-text-secondary);
        font-size: var(--oc-control-font-size);
        line-height: 1.5;
      }
    </style>
  </details>
}
