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
        --select-icon: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3E%3Cpath fill='none' stroke='black' stroke-width='1.5' stroke-linecap='round' stroke-linejoin='round' d='M4 6l4 4 4-4'/%3E%3C/svg%3E");
        display: flex;
        align-items: center;
        gap: var(--control-gap);
        box-sizing: border-box;
        width: 100%;
        min-height: var(--control-height);
        padding-block: 0;
        padding-inline: var(--control-padding-inline);
        border: 1px solid var(--control-border);
        border-radius: var(--border-radius);
        background: var(--control-background);
        color: var(--control-text-primary);
        font-size: var(--control-font-size);
        transition:
          border-color 0.15s ease,
          box-shadow 0.15s ease;
      }
      .root:not(:has(.field:focus-visible)):has(.field:enabled):hover {
        border-color: var(--control-border-hover);
      }
      .root:has(.field:focus-visible) {
        border-color: var(--control-border-focus);
      }
      .root:has(.field:disabled) {
        opacity: 0.55;
        cursor: not-allowed;
      }
      .field {
        flex: 1;
        min-width: 0;
        width: 100%;
        height: var(--control-height);
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
        color: var(--control-text-primary);
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
        background-color: var(--control-text-primary);
        mask: var(--select-icon) center / 1rem no-repeat;
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
          background-color: var(--control-text-primary);
          mask: var(--select-icon) center / 1rem no-repeat;
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
          border-radius: var(--border-radius);
          background: var(--select-picker-background);
          color: var(--control-text-primary);
          font: inherit;
          min-width: anchor-size(width);
          max-height: min(20rem, 70vh);
          overflow: auto;
          box-shadow: 0 0.75rem 1.75rem rgb(0 0 0 / 0.3);
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
        .field :global(optgroup) {
          background: transparent;
          /* Affects the optgroup label as .field :global(option) is more specific
          for the actual option text. */
          color: var(--control-text-secondary);
          font: inherit;
          font-style: normal;
        }
        .field :global(option) {
          display: flex;
          align-items: center;
          gap: var(--control-gap);
          padding: 0.5rem 0.625rem;
          border: 0;
          border-radius: calc(var(--border-radius) - 0.125rem);
          background: transparent;
          color: var(--control-text-primary);
          font: inherit;
          font-style: normal;
          font-weight: normal;
          white-space: nowrap;
          cursor: pointer;
        }
        .field :global(option:not(:disabled):hover),
        .field :global(option:focus),
        .field :global(option:checked),
        .field :global(option:checked:hover),
        .field :global(option:checked:focus) {
          background: var(--control-background-active);
        }
        .field :global(option:disabled) {
          opacity: 0.5;
          cursor: not-allowed;
        }
        .field :global(option)::checkmark {
          order: 1;
          margin-inline-start: auto;
          color: var(--control-text-primary);
        }
      }
    </style>
  </div>
}
