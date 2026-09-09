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
        padding: 0.5rem var(--control-padding-inline);
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
        color: var(--control-placeholder-text);
      }
      .field:disabled {
        resize: none;
        pointer-events: none;
      }
    </style>
  </div>
}
