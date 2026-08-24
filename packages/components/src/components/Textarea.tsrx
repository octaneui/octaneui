import type { Octane } from "octane/jsx-runtime";

type TextareaNativeProps = Omit<
  Octane.TextareaHTMLAttributes<HTMLTextAreaElement>,
  "className"
>;

export interface TextareaProps extends TextareaNativeProps {}

export function Textarea({ style, ...rest }: TextareaProps) @{
  <div class={["root", rest.class]} style={style}>
    <textarea {...rest} class="field" />

    <style>
      .root {
        display: flex;
        box-sizing: border-box;
        width: 100%;
        padding: 0.5rem var(--control-pad-x, 0.75rem);
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
        display: block;
        width: 100%;
        min-height: 6.5rem;
        margin: 0;
        padding: 0;
        border: 0;
        background: transparent;
        color: inherit;
        font: inherit;
        line-height: 1.5;
        outline: none;
        resize: vertical;
        field-sizing: content;
      }
      .field::placeholder {
        color: var(--control-muted);
      }
      .field:disabled {
        resize: none;
      }
    </style>
  </div>
}
