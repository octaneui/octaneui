import type { Octane } from "octane/jsx-runtime";

type PopoverNativeProps = Omit<
  Octane.HTMLAttributes<HTMLDivElement>,
  "className"
>;

export interface PopoverProps extends PopoverNativeProps {}

export function Popover({
  children,
  style,
  popover = "auto",
  ...rest
}: PopoverProps) @{
  <div
    {...rest}
    popover={popover}
    class={["root", rest.class]}
    style={style}
  >
    {children}

    <style>
      .root {
        box-sizing: border-box;
        width: max-content;
        max-width: min(18rem, calc(100vw - 2rem));
        margin-block: var(--control-gap);
        overflow-wrap: anywhere;
        inset: auto;
        padding: 0.5rem 1.25rem;
        border: 1px solid var(--control-border);
        border-radius: var(--border-radius);
        background: var(--control-background);
        color: var(--control-text-primary);
        box-shadow: 0 0.75rem 1.75rem rgb(0 0 0 / 0.45);
        position-area: bottom span-right;
        position-try-fallbacks: flip-block, flip-inline, flip-block flip-inline;
      }
      .root:focus:not(:focus-visible) {
        outline: none;
      }
    </style>
  </div>
}
