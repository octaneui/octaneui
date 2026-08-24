import type { OctaneNode } from "octane";
import type { Octane } from "octane/jsx-runtime";

type SelectNativeProps = Omit<
  Octane.SelectHTMLAttributes<HTMLSelectElement>,
  "className"
>;

export interface SelectProps extends SelectNativeProps {
  left?: OctaneNode;
}

export function Select({
  left,
  style,
  children,
  ...rest
}: SelectProps) @{
  <div class={["root", rest.class]} style={style}>
    @if (left) {
      <span class="slot">{left}</span>
    }
    <select {...rest} class="field">
      {children}
    </select>

    <style>
      .root {
        --select-chevron: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3E%3Cpath fill='none' stroke='black' stroke-width='1.5' stroke-linecap='round' stroke-linejoin='round' d='M4 6l4 4 4-4'/%3E%3C/svg%3E");
        display: flex;
        align-items: center;
        gap: var(--control-gap, 0.5rem);
        box-sizing: border-box;
        width: 100%;
        min-height: var(--control-height, 2.25rem);
        padding: 0 var(--control-pad-x, 0.75rem);
        border: 1px solid var(--control-border);
        border-radius: var(--radius, 0.625rem);
        background: var(--control-bg);
        color: var(--control-text);
        font-size: var(--control-font-size, 0.9375rem);
        transition:
          border-color 0.15s ease,
          box-shadow 0.15s ease;
      }
      .root:hover {
        border-color: color-mix(
          in srgb,
          var(--control-accent) 40%,
          var(--control-border)
        );
      }
      .root:focus-within {
        border-color: var(--control-accent);
        box-shadow: var(--control-ring);
      }
      .root:has(.field:disabled) {
        opacity: 0.55;
        cursor: not-allowed;
      }
      .field {
        flex: 1;
        min-width: 0;
        width: 100%;
        height: var(--control-height, 2.25rem);
        margin: 0;
        padding: 0;
        border: 0;
        background: transparent;
        color: inherit;
        font: inherit;
        outline: none;
        cursor: pointer;
        appearance: none;
      }
      .field:disabled {
        cursor: not-allowed;
      }
      .slot {
        display: inline-flex;
        flex-shrink: 0;
        align-items: center;
        justify-content: center;
        color: var(--control-muted);
        line-height: 1;
        pointer-events: none;
      }
      .slot :where(svg) {
        display: block;
        width: 1rem;
        height: 1rem;
      }

      /* Fallback chevron when the picker cannot be restyled. */
      .root::after {
        content: "";
        flex-shrink: 0;
        width: 1rem;
        height: 1rem;
        background-color: var(--control-muted);
        mask: var(--select-chevron) center / 1rem no-repeat;
        pointer-events: none;
      }

      @supports (appearance: base-select) {
        .root::after {
          display: none;
        }
        .field,
        .field::picker(select) {
          appearance: base-select;
        }
        .field {
          display: flex;
          align-items: center;
        }
        .field::picker-icon {
          content: "";
          flex-shrink: 0;
          width: 1rem;
          height: 1rem;
          margin-inline-start: auto;
          background-color: var(--control-muted);
          mask: var(--select-chevron) center / 1rem no-repeat;
          transition: rotate 0.15s ease;
        }
        .field:open::picker-icon {
          rotate: 180deg;
        }
        .field::picker(select) {
          box-sizing: border-box;
          margin: 0;
          padding: 0.25rem;
          border: 1px solid var(--control-border);
          border-radius: var(--radius, 0.625rem);
          background: var(--control-picker-bg);
          color: var(--control-text);
          font: inherit;
          min-width: anchor-size(width);
          max-height: min(20rem, 70vh);
          overflow: auto;
          box-shadow: 0 0.75rem 1.75rem rgb(0 0 0 / 0.45);
          top: calc(anchor(bottom) + 0.35rem);
          left: anchor(left);
          opacity: 0;
          translate: 0 -0.25rem;
          transition:
            opacity 0.15s ease,
            translate 0.15s ease,
            overlay 0.15s allow-discrete,
            display 0.15s allow-discrete;
        }
        .field:open::picker(select) {
          opacity: 1;
          translate: 0 0;
        }
        @starting-style {
          .field:open::picker(select) {
            opacity: 0;
            translate: 0 -0.25rem;
          }
        }
        .field :global(option) {
          display: flex;
          align-items: center;
          gap: var(--control-gap, 0.5rem);
          padding: 0.5rem 0.625rem;
          border: 0;
          border-radius: calc(var(--radius, 0.625rem) - 0.125rem);
          background: transparent;
          color: inherit;
          font: inherit;
          white-space: nowrap;
          cursor: pointer;
        }
        .field :global(option:hover),
        .field :global(option:focus) {
          background: color-mix(
            in srgb,
            var(--control-accent) 12%,
            transparent
          );
        }
        .field :global(option:checked) {
          background: color-mix(
            in srgb,
            var(--control-accent) 16%,
            transparent
          );
        }
        .field :global(option:checked:hover),
        .field :global(option:checked:focus) {
          background: color-mix(
            in srgb,
            var(--control-accent) 22%,
            transparent
          );
        }
        .field :global(option:disabled) {
          opacity: 0.5;
          cursor: not-allowed;
        }
        .field :global(option)::checkmark {
          order: 1;
          margin-inline-start: auto;
          color: var(--control-accent);
        }
        .field :global(optgroup) {
          background: transparent;
          color: var(--control-muted);
          font: inherit;
          font-weight: 600;
          font-style: normal;
        }
      }
    </style>
  </div>
}
