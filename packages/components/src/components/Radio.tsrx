import type { OctaneNode } from "octane";
import type { Octane } from "octane/jsx-runtime";

type RadioNativeProps = Omit<
  Octane.InputHTMLAttributes<HTMLInputElement>,
  "className" | "type"
>;

export interface RadioProps extends RadioNativeProps {
  children?: OctaneNode;
}

type RadioGroupNativeProps = Omit<
  Octane.FieldsetHTMLAttributes<HTMLFieldSetElement>,
  "className"
>;

export interface RadioGroupProps extends RadioGroupNativeProps {
  legend?: OctaneNode;
}

export function Radio({ children, style, ...rest }: RadioProps) @{
  <label class={["root", rest.class]} style={style}>
    <input {...rest} type="radio" class="field" />
    <span class="box" aria-hidden="true" />
    @if (children) {
      <span class="label">{children}</span>
    }

    <style>
      .root {
        position: relative;
        display: inline-flex;
        align-items: center;
        gap: var(--control-gap);
        color: var(--control-text);
        font-size: var(--control-font-size);
        line-height: 1.3;
        cursor: pointer;
        user-select: none;
      }
      .root:has(.field:disabled) {
        opacity: 0.55;
        cursor: not-allowed;
      }
      .field {
        position: absolute;
        width: 1px;
        height: 1px;
        margin: 0;
        padding: 0;
        overflow: hidden;
        clip: rect(0 0 0 0);
        white-space: nowrap;
        border: 0;
      }
      .box {
        display: inline-flex;
        flex-shrink: 0;
        align-items: center;
        justify-content: center;
        box-sizing: border-box;
        width: 1.125rem;
        height: 1.125rem;
        border: 1px solid var(--control-border);
        border-radius: 50%;
        background: var(--control-bg);
        transition:
          border-color 0.15s ease,
          box-shadow 0.15s ease;
      }
      .field:checked + .box::after {
        content: "";
        width: 0.5rem;
        height: 0.5rem;
        border-radius: 50%;
        background: var(--control-accent-color);
      }
      .root:hover .field:not(:disabled) + .box {
        border-color: color-mix(
          in srgb,
          var(--control-strong) 40%,
          var(--control-border)
        );
      }
      .field:focus-visible + .box {
        box-shadow: var(--control-ring);
      }
    </style>
  </label>
}

export function RadioGroup({
  legend,
  children,
  style,
  ...rest
}: RadioGroupProps) @{
  <fieldset {...rest} class={["group", rest.class]} style={style}>
    @if (legend) {
      <legend class="legend">{legend}</legend>
    }
    <div class="options">{children}</div>

    <style>
      .group {
        margin: 0;
        padding: 0;
        border: 0;
        min-width: 0;
      }
      .legend {
        padding: 0;
        margin-bottom: 0.5rem;
        color: var(--control-text);
        font-size: var(--control-font-size);
        font-weight: 600;
      }
      .options {
        display: flex;
        flex-direction: column;
        gap: 0.5rem;
      }
    </style>
  </fieldset>
}
