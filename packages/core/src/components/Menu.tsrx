import type { OctaneNode } from "octane";
import type { Octane } from "octane/jsx-runtime";

type DivProps = Omit<Octane.HTMLAttributes<HTMLDivElement>, "className">;

type MenuNativeProps = Omit<
  DivProps,
  "role" | "aria-orientation"
>;

export interface MenuProps extends MenuNativeProps {
  onToggle?: (event: ToggleEvent & { currentTarget: HTMLDivElement }) => void;
}

function menuItems(menu: HTMLElement): HTMLButtonElement[] {
  return Array.from(
    menu.querySelectorAll<HTMLButtonElement>('[role="menuitem"]:not(:disabled)'),
  ).filter((item) => item.closest('[role="menu"]') === menu);
}

export function Menu({
  children,
  style,
  popover = "auto",
  onKeyDown,
  onToggle,
  ...rest
}: MenuProps) @{
  function handleToggle(
    event: ToggleEvent & { currentTarget: HTMLDivElement },
  ) {
    onToggle?.(event);
    if (event.defaultPrevented || event.newState !== "open") return;
    const menu = event.currentTarget;
    if (
      menu.contains(document.activeElement) &&
      document.activeElement !== menu
    ) return;
    menuItems(menu)[0]?.focus();
  }

  function handleKeyDown(
    event: KeyboardEvent & { currentTarget: HTMLDivElement },
  ) {
    onKeyDown?.(event);
    if (event.defaultPrevented) return;
    const menu = event.currentTarget;
    const items = menuItems(menu);
    if (event.key === "Tab") {
      menu.hidePopover();
      return;
    }
    if (items.length === 0) return;
    const index = items.indexOf(document.activeElement as HTMLButtonElement);
    let next = -1;
    if (event.key === "ArrowDown") {
      next = index < 0 ? 0 : (index + 1) % items.length;
    } else if (event.key === "ArrowUp") {
      next = index < 0
        ? items.length - 1
        : (index - 1 + items.length) % items.length;
    } else if (event.key === "Home") {
      next = 0;
    } else if (event.key === "End") {
      next = items.length - 1;
    } else return;
    event.preventDefault();
    items[next]?.focus();
  }

  <div
    tabIndex={-1}
    {...rest}
    popover={popover}
    role="menu"
    aria-orientation="vertical"
    class={["root", rest.class]}
    style={style}
    onToggle={handleToggle}
    onKeyDown={handleKeyDown}
  >
    {children}

    <style>
      .root {
        box-sizing: border-box;
        min-width: 10rem;
        width: max-content;
        max-width: min(18rem, calc(100vw - 2rem));
        margin-block: var(--control-gap);
        inset: auto;
        padding: 0.25rem;
        border: 1px solid var(--control-border);
        border-radius: var(--border-radius);
        background: var(--control-background);
        color: var(--control-text-primary);
        box-shadow: 0 0.75rem 1.75rem rgb(0 0 0 / 0.45);
        position-area: bottom span-right;
        position-try-fallbacks: flip-block, flip-inline, flip-block flip-inline;
      }
      .root:focus:not(:focus-visible) {
        outline: none;
      }
    </style>
  </div>
}

type MenuItemNativeProps = Omit<
  Octane.ButtonHTMLAttributes<HTMLButtonElement>,
  "className" | "type" | "role" | "tabIndex"
>;

export interface MenuItemProps extends MenuItemNativeProps {
  left?: OctaneNode;
  right?: OctaneNode;
}

export function MenuItem({
  left,
  right,
  children,
  disabled,
  onClick,
  ...rest
}: MenuItemProps) @{
  function handleClick(
    event: MouseEvent & { currentTarget: HTMLButtonElement },
  ) {
    onClick?.(event);
    if (event.defaultPrevented || disabled) return;
    const menu = event.currentTarget.closest("[popover]");
    if (menu instanceof HTMLElement && menu.matches(":popover-open")) {
      menu.hidePopover();
    }
  }

  <button
    {...rest}
    type="button"
    role="menuitem"
    tabIndex={-1}
    disabled={disabled}
    class={["item", rest.class]}
    onClick={handleClick}
  >
    @if (left) {
      <span class="slot">{left}</span>
    }
    <span class="label">{children}</span>
    @if (right) {
      <span class="slot">{right}</span>
    }

    <style>
      .item {
        display: flex;
        align-items: center;
        gap: var(--control-gap);
        box-sizing: border-box;
        width: 100%;
        min-height: 2.25rem;
        padding-block: 0;
        padding-inline: var(--control-padding-inline);
        border: 0;
        border-radius: calc(var(--border-radius) - 0.125rem);
        background: transparent;
        color: inherit;
        font: inherit;
        font-size: var(--control-font-size);
        font-weight: 500;
        line-height: 1.3;
        text-align: start;
        cursor: pointer;
        user-select: none;
      }
      .item:hover:not(:disabled) {
        background: var(--control-background-active);
      }
      .item:focus-visible {
        outline: 2px solid var(--control-accent);
        outline-offset: -2px;
      }
      .item:disabled {
        opacity: 0.55;
        cursor: not-allowed;
      }
      .label {
        flex: 1;
        min-width: 0;
      }
      .slot {
        display: inline-flex;
        flex-shrink: 0;
        align-items: center;
        justify-content: center;
        color: var(--control-text-secondary);
      }
      .slot :where(svg) {
        display: block;
        width: 1rem;
        height: 1rem;
      }
    </style>
  </button>
}

export interface MenuSeparatorProps extends Omit<
  DivProps,
  "role"
> {}

export function MenuSeparator({ ...rest }: MenuSeparatorProps) @{
  <div
    {...rest}
    role="separator"
    class={["separator", rest.class]}
  >
    <style>
      .separator {
        height: 1px;
        margin: 0.25rem 0.5rem;
        background: var(--control-border);
      }
    </style>
  </div>
}
