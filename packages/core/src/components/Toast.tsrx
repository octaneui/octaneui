import {
  createContext,
  useContext,
  useEffect,
  useId,
  useRef,
  useState,
} from "octane";
import type { OctaneNode } from "octane";
import type { Octane } from "octane/jsx-runtime";

type ToastNativeProps = Omit<
  Octane.HTMLAttributes<HTMLDivElement>,
  "className"
>;

export type ToastVariant = "success" | "warn" | "error" | "info";

export type ToastPosition =
  | "top left"
  | "top center"
  | "top right"
  | "bottom left"
  | "bottom center"
  | "bottom right";

export interface ToastProps extends ToastNativeProps {
  variant?: ToastVariant;
  left?: OctaneNode;
  right?: OctaneNode;
}

export function Toast({
  variant = "info",
  left,
  right,
  children,
  style,
  ...rest
}: ToastProps) @{
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
        gap: var(--control-gap);
        box-sizing: border-box;
        width: 100%;
        padding: 0.75rem var(--control-padding-inline);
        border: 1px solid var(--toast-info-border);
        border-radius: var(--border-radius);
        background: var(--toast-info-background);
        color: var(--toast-info-text);
        font-size: var(--control-font-size);
        line-height: 1.4;
        box-shadow: 0 0.5rem 1rem var(--shadow-color);
        animation: toast-in 0.2s ease;
      }
      .success {
        border-color: var(--toast-success-border);
        background: var(--toast-success-background);
        color: var(--toast-success-text);
      }
      .warn {
        border-color: var(--toast-warn-border);
        background: var(--toast-warn-background);
        color: var(--toast-warn-text);
      }
      .error {
        border-color: var(--toast-error-border);
        background: var(--toast-error-background);
        color: var(--toast-error-text);
      }
      .info {
        border-color: var(--toast-info-border);
        background: var(--toast-info-background);
        color: var(--toast-info-text);
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
      @keyframes toast-in {
        from {
          opacity: 0;
          transform: translateY(0.4rem);
        }
        to {
          opacity: 1;
          transform: none;
        }
      }
    </style>
  </div>
}

export interface ToastOptions {
  id?: string;
  variant?: ToastVariant;
  left?: OctaneNode;
  right?: OctaneNode;
  children: OctaneNode;
  duration?: number;
  closable?: boolean;
}

export interface ToastApi {
  toast: (options: ToastOptions) => string;
  dismiss: (id?: string) => void;
}

const ToastContext = createContext<ToastApi | null>(null);

export function useToast(): ToastApi {
  const context = useContext(ToastContext);
  if (!context) {
    throw new Error("useToast must be used inside ToastProvider.");
  }
  return context;
}

type DivProps = Omit<Octane.HTMLAttributes<HTMLDivElement>, "className">;

export interface ToastProviderProps extends DivProps {
  position?: ToastPosition;
  duration?: number;
  contained?: boolean;
}

interface ToastRecord {
  id: string;
  variant: ToastVariant;
  left?: OctaneNode;
  right?: OctaneNode;
  children: OctaneNode;
  duration: number;
  closable: boolean;
}

let toastSeq = 0;

export function ToastProvider({
  position = "bottom right",
  duration = 4000,
  contained = false,
  children,
  ...rest
}: ToastProviderProps) @{
  const prefix = useId();
  const [toasts, setToasts] = useState<ToastRecord[]>([]);
  const [block, inline] = position.split(" ");

  function toast(options: ToastOptions): string {
    toastSeq += 1;
    const id = options.id ?? `${prefix}-${toastSeq}`;
    const record: ToastRecord = {
      id,
      variant: options.variant ?? "info",
      left: options.left,
      right: options.right,
      children: options.children,
      duration: options.duration ?? duration,
      closable: options.closable ?? true,
    };
    setToasts((list) => {
      const index = list.findIndex((item) => item.id === id);
      if (index === -1) return [...list, record];
      const next = list.slice();
      next[index] = record;
      return next;
    });
    return id;
  }

  function dismiss(id?: string) {
    if (id === undefined) {
      setToasts([]);
      return;
    }
    setToasts((list) => list.filter((item) => item.id !== id));
  }

  <ToastContext value={{ toast, dismiss }}>
    <div
      {...rest}
      class={["host", contained ? "contained" : undefined, rest.class]}
    >
      {children}
      <ol
        class={["viewport", block, inline]}
        aria-label="Notifications"
        aria-live="polite"
        aria-relevant="additions text"
      >
        @for (const item of toasts; key item.id) {
          <li class="item">
            <QueuedToast item={item} onDismiss={dismiss} />
          </li>
        }
      </ol>

      <style>
        .host {
          display: contents;
        }
        .contained {
          display: block;
          position: relative;
          min-height: 14rem;
          width: 100%;
        }
        .viewport {
          position: fixed;
          z-index: 100;
          display: flex;
          flex-direction: column;
          gap: var(--control-gap);
          box-sizing: border-box;
          width: min(22rem, calc(100vw - 2rem));
          margin: 0;
          padding: 1rem;
          list-style: none;
          pointer-events: none;
        }
        .contained .viewport {
          position: absolute;
          width: min(22rem, calc(100% - 1rem));
        }
        .top {
          top: 0;
        }
        .bottom {
          bottom: 0;
          flex-direction: column-reverse;
        }
        .left {
          left: 0;
        }
        .right {
          right: 0;
        }
        .center {
          left: 50%;
          transform: translateX(-50%);
        }
        .item {
          pointer-events: auto;
        }
      </style>
    </div>
  </ToastContext>
}

function QueuedToast({
  item,
  onDismiss,
}: {
  item: ToastRecord;
  onDismiss: (id: string) => void;
}) @{
  const onDismissRef = useRef(onDismiss);
  onDismissRef.current = onDismiss;

  useEffect(() => {
    if (item.duration <= 0) return;
    const timer = setTimeout(() => onDismissRef.current(item.id), item.duration);
    return () => clearTimeout(timer);
  }, [item.id, item.duration]);

  function handleDismiss() {
    onDismiss(item.id);
  }

  <Toast
    variant={item.variant}
    left={item.left}
    right={
      item.right ??
      (item.closable ? <ToastDismiss onClick={handleDismiss} /> : undefined)
    }
  >
    {item.children}
  </Toast>
}

function ToastDismiss({ onClick }: { onClick: () => void }) @{
  <button type="button" class="dismiss" aria-label="Dismiss" onClick={onClick}>
    <svg
      xmlns="http://www.w3.org/2000/svg"
      width="16"
      height="16"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      stroke-width="2"
      stroke-linecap="round"
      stroke-linejoin="round"
      aria-hidden="true"
    >
      <path d="M18 6 6 18" />
      <path d="m6 6 12 12" />
    </svg>
    <style>
      .dismiss {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 1.5rem;
        height: 1.5rem;
        padding: 0;
        border: 0;
        border-radius: calc(var(--border-radius) - 0.15rem);
        background: transparent;
        color: inherit;
        cursor: pointer;
      }
      .dismiss:hover {
        background: rgb(255 255 255 / 0.08);
      }
      .dismiss:focus-visible {
        outline: 2px solid currentColor;
        outline-offset: 1px;
      }
      .dismiss svg {
        display: block;
      }
    </style>
  </button>
}
