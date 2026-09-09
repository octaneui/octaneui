import type { OctaneNode } from "octane";
import type { Octane } from "octane/jsx-runtime";

type AlertNativeProps = Omit<
  Octane.HTMLAttributes<HTMLDivElement>,
  "className"
>;

export type AlertType = "success" | "warn" | "error" | "info";

export interface AlertProps extends AlertNativeProps {
  type?: AlertType;
  left?: OctaneNode;
  right?: OctaneNode;
}

export function Alert({
  type = "info",
  left,
  right,
  children,
  style,
  ...rest
}: AlertProps) @{
  <div
    role={type === "error" || type === "warn" ? "alert" : "status"}
    {...rest}
    class={["root", type, rest.class]}
    style={style}
  >
    @if (left) {
      <span class="slot">{left}</span>
    }
    <div class="body">{children}</div>
    @if (right) {
      <span class="slot">{right}</span>
    }

    <style>
      .root {
        display: flex;
        align-items: center;
        gap: var(--control-gap);
        box-sizing: border-box;
        width: 100%;
        padding: 0.75rem var(--control-padding-inline);
        border: 1px solid var(--alert-info-border);
        border-radius: var(--border-radius);
        background: var(--alert-info-background);
        color: var(--alert-info-text);
        font-size: var(--control-font-size);
        line-height: 1.4;
      }
      .success {
        border-color: var(--alert-success-border);
        background: var(--alert-success-background);
        color: var(--alert-success-text);
      }
      .warn {
        border-color: var(--alert-warn-border);
        background: var(--alert-warn-background);
        color: var(--alert-warn-text);
      }
      .error {
        border-color: var(--alert-error-border);
        background: var(--alert-error-background);
        color: var(--alert-error-text);
      }
      .info {
        border-color: var(--alert-info-border);
        background: var(--alert-info-background);
        color: var(--alert-info-text);
      }
      .body {
        flex: 1;
        min-width: 0;
      }
      .slot {
        display: inline-flex;
        flex-shrink: 0;
        align-items: center;
        justify-content: center;
        line-height: 1;
      }
      .slot :where(svg) {
        display: block;
        width: 1rem;
        height: 1rem;
      }
    </style>
  </div>
}
