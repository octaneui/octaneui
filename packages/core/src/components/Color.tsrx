import type { Octane } from "octane/jsx-runtime";

type ColorNativeProps = Omit<
  Octane.InputHTMLAttributes<HTMLInputElement>,
  "className" | "type"
>;

export interface ColorProps extends ColorNativeProps {}

export function Color({ style, ...rest }: ColorProps) @{
  <div class={["root", rest.class]} style={style}>
    <input {...rest} type="color" class="field" />

    <style>
      .root {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        box-sizing: border-box;
        width: var(--control-height);
        height: var(--control-height);
        padding: 0.25rem;
        border: 1px solid var(--control-border);
        border-radius: var(--border-radius);
        background: var(--control-background);
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
        box-sizing: border-box;
        width: 100%;
        height: 100%;
        margin: 0;
        padding: 0;
        border: 0;
        background: transparent;
        cursor: pointer;
        appearance: none;
      }
      .field:disabled {
        cursor: not-allowed;
      }
      .field::-webkit-color-swatch-wrapper {
        padding: 0;
      }
      .field::-webkit-color-swatch {
        border: 0;
        border-radius: calc(var(--border-radius) - 0.35rem);
      }
      .field::-moz-color-swatch {
        border: 0;
        border-radius: calc(var(--border-radius) - 0.35rem);
      }
    </style>
  </div>
}
