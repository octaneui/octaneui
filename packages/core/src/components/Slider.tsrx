import type { Octane } from "octane/jsx-runtime";

type SliderNativeProps = Omit<
  Octane.InputHTMLAttributes<HTMLInputElement>,
  "className" | "type"
>;

export interface SliderProps extends SliderNativeProps {}

export function Slider({ style, ...rest }: SliderProps) @{
  <div class={["root", rest.class]} style={style}>
    <input {...rest} type="range" class="field" />

    <style>
      .root {
        display: flex;
        align-items: center;
        box-sizing: border-box;
        width: 100%;
        min-height: var(--oc-control-height);
        color: var(--oc-control-text-primary);
      }
      .root:has(.field:disabled) {
        opacity: 0.55;
        cursor: not-allowed;
      }
      .field {
        width: 100%;
        height: 1.25rem;
        margin: 0;
        padding: 0;
        background: transparent;
        accent-color: var(--oc-control-accent);
        cursor: pointer;
        appearance: none;
      }
      .field:disabled {
        cursor: not-allowed;
      }
      .field:focus-visible {
        outline: 1px solid var(--oc-control-accent);
      }
      .field::-webkit-slider-runnable-track {
        height: 0.375rem;
        border: 0;
        border-radius: 999px;
        background: var(--oc-control-track-background);
      }
      .field::-webkit-slider-thumb {
        appearance: none;
        width: 1.125rem;
        height: 1.125rem;
        margin-top: -0.375rem;
        border: 1px solid var(--oc-control-border);
        border-radius: 50%;
        background: var(--oc-control-thumb-background);
      }
      .field::-moz-range-track {
        height: 0.375rem;
        border: 1px solid var(--oc-control-border);
        border-radius: 999px;
        background: var(--oc-control-track-background);
      }
      .field::-moz-range-progress {
        height: 0.375rem;
        border: 1px solid var(--oc-control-border);
        border-radius: 999px;
        background: var(--oc-control-accent);
      }
      .field::-moz-range-thumb {
        width: 1.125rem;
        height: 1.125rem;
        border: 1px solid var(--oc-control-border);
        border-radius: 50%;
        background: var(--oc-control-thumb-background);
      }
      @supports selector(::slider-track) {
        .field::slider-track {
          height: 0.375rem;
          border: 0;
          border-radius: 999px;
          background: var(--oc-control-track-background);
        }
        .field::slider-fill {
          background: var(--oc-control-accent);
        }
        .field::slider-thumb {
          width: 1.125rem;
          height: 1.125rem;
          border: 0;
          border-radius: 50%;
          background: var(--oc-control-thumb-background);
        }
      }
    </style>
  </div>
}
