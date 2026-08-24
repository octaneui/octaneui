import type { Octane } from "octane/jsx-runtime";

type DialogNativeProps = Omit<
  Octane.DialogHTMLAttributes<HTMLDialogElement>,
  "className"
>;

export interface DialogProps extends DialogNativeProps {}

export function Dialog({ children, style, ...rest }: DialogProps) @{
  <dialog {...rest} class={["root", rest.class]} style={style}>
    {children}

    <style>
      .root {
        box-sizing: border-box;
        width: min(28rem, calc(100% - 2rem));
        margin: auto;
        padding: 1.25rem;
        border: 1px solid var(--control-border);
        border-radius: var(--radius, 0.625rem);
        background: var(--control-bg);
        color: var(--control-text);
        box-shadow: 0 0.75rem 1.75rem rgb(0 0 0 / 0.45);
      }
      .root::backdrop {
        background: rgb(0 0 0 / 0.55);
      }
      .root:focus {
        outline: none;
      }
      .root:focus-visible {
        box-shadow: var(--control-ring);
      }
    </style>
  </dialog>
}
