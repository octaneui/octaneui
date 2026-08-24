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
        min-height: var(--control-height, 2.25rem);
        color: var(--control-text);
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
        accent-color: var(--control-accent);
        cursor: pointer;
        appearance: none;
      }
      .field:disabled {
        cursor: not-allowed;
      }
      .field:focus-visible {
        outline: none;
      }
      .field:focus-visible::-webkit-slider-thumb {
        box-shadow: var(--control-ring);
      }
      .field:focus-visible::-moz-range-thumb {
        box-shadow: var(--control-ring);
      }
      .field::-webkit-slider-runnable-track {
        height: 0.375rem;
        border: 0;
        border-radius: 999px;
        background: var(--control-border);
      }
      .field::-webkit-slider-thumb {
        appearance: none;
        width: 1.125rem;
        height: 1.125rem;
        margin-top: -0.375rem;
        border: 0;
        border-radius: 50%;
        background: var(--control-accent);
      }
      .field::-moz-range-track {
        height: 0.375rem;
        border: 0;
        border-radius: 999px;
        background: var(--control-border);
      }
      .field::-moz-range-progress {
        height: 0.375rem;
        border: 0;
        border-radius: 999px;
        background: var(--control-accent);
      }
      .field::-moz-range-thumb {
        width: 1.125rem;
        height: 1.125rem;
        border: 0;
        border-radius: 50%;
        background: var(--control-accent);
      }
      @supports selector(::slider-track) {
        .field::slider-track {
          height: 0.375rem;
          border: 0;
          border-radius: 999px;
          background: var(--control-border);
        }
        .field::slider-fill {
          background: var(--control-accent);
        }
        .field::slider-thumb {
          width: 1.125rem;
          height: 1.125rem;
          border: 0;
          border-radius: 50%;
          background: var(--control-accent);
        }
      }
    </style>
  </div>
}
