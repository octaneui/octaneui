import type { Octane } from "octane/jsx-runtime";

type ProgressNativeProps = Omit<
  Octane.ProgressHTMLAttributes<HTMLProgressElement>,
  "className"
>;

export interface ProgressProps extends ProgressNativeProps {}

export function Progress({ style, ...rest }: ProgressProps) @{
  <progress {...rest} class={["root", rest.class]} style={style}>
    <style>
      .root {
        display: block;
        box-sizing: border-box;
        width: 100%;
        height: 0.5rem;
        border: 0;
        border-radius: 999px;
        background: var(--control-border);
        accent-color: var(--control-accent-color);
        overflow: hidden;
        vertical-align: middle;
        appearance: none;
      }
      .root::-webkit-progress-bar {
        background: var(--control-border);
        border-radius: 999px;
      }
      .root::-webkit-progress-value {
        background: var(--control-accent-color);
        border-radius: 999px;
      }
      .root::-moz-progress-bar {
        background: var(--control-accent-color);
        border-radius: 999px;
      }
      .root:indeterminate::-webkit-progress-bar {
        background: var(--control-border);
      }
    </style>
  </progress>
}
