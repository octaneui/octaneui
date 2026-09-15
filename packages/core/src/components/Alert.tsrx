import type { OctaneNode } from "octane";
import type { Octane } from "octane/jsx-runtime";

type AlertNativeProps = Omit<
  Octane.HTMLAttributes<HTMLDivElement>,
  "className"
>;

export type AlertVariant = "success" | "warn" | "error" | "info";

export interface AlertProps extends AlertNativeProps {
  variant?: AlertVariant;
  left?: OctaneNode;
  right?: OctaneNode;
}

export function Alert({
  variant = "info",
  left,
  right,
  children,
  style,
  ...rest
}: AlertProps) @{
  <div
    role={variant === "error" || variant === "warn" ? "alert" : "status"}
    {...rest}
    class={["root", variant, rest.class]}
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
        gap: var(--oc-control-gap);
        box-sizing: border-box;
        width: 100%;
        padding: 0.75rem var(--oc-control-padding-inline);
        border: 1px solid var(--oc-alert-info-border);
        border-radius: var(--oc-border-radius);
        background: var(--oc-alert-info-background);
        color: var(--oc-alert-info-text);
        font-size: var(--oc-control-font-size);
        line-height: 1.4;
      }
      .success {
        border-color: var(--oc-alert-success-border);
        background: var(--oc-alert-success-background);
        color: var(--oc-alert-success-text);
      }
      .warn {
        border-color: var(--oc-alert-warn-border);
        background: var(--oc-alert-warn-background);
        color: var(--oc-alert-warn-text);
      }
      .error {
        border-color: var(--oc-alert-error-border);
        background: var(--oc-alert-error-background);
        color: var(--oc-alert-error-text);
      }
      .info {
        border-color: var(--oc-alert-info-border);
        background: var(--oc-alert-info-background);
        color: var(--oc-alert-info-text);
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
