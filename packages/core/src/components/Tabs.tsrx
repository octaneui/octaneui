import { createContext, useContext, useId, useState } from "octane";
import type { Octane } from "octane/jsx-runtime";

type DivProps = Omit<Octane.HTMLAttributes<HTMLDivElement>, "className">;

type SelectionProps =
  | { value: string; defaultValue?: string }
  | { value?: undefined; defaultValue: string };

export type TabsProps =
  DivProps & SelectionProps & {
    onValueChange?: (value: string) => void;
  };

interface TabsContextValue {
  id: string;
  value: string;
  select: (value: string) => void;
}

const TabsContext = createContext<TabsContextValue | null>(null);

function useTabs() {
  const context = useContext(TabsContext);
  if (
    !context
  ) throw new Error("TabList, Tab, and TabPanel must be inside Tabs.");
  return context;
}

export function Tabs({
  value,
  defaultValue,
  onValueChange,
  children,
  ...rest
}: TabsProps) @{
  const id = useId();
  const [selection, setSelection] = useState(defaultValue ?? value ?? "");
  const selected = value ?? selection;

  function select(next: string) {
    if (next === selected) return;
    if (value === undefined) setSelection(next);
    onValueChange?.(next);
  }

  <TabsContext value={{ id, value: selected, select }}>
    <div {...rest} class={["root", rest.class]}>
      {children}
      <style>
        .root {
          min-width: 0;
          width: 100%;
        }
      </style>
    </div>
  </TabsContext>
}

export interface TabListProps extends Omit<
  DivProps,
  "role" | "aria-orientation"
> {}

export function TabList({ children, ...rest }: TabListProps) @{
  useTabs();

  <div
    {...rest}
    role="tablist"
    aria-orientation="horizontal"
    class={["list", rest.class]}
  >
    {children}
    <style>
      .list {
        display: flex;
        gap: var(--control-gap);
        overflow-x: auto;
        padding: 0.25rem;
      }
    </style>
  </div>
}

export interface TabProps extends Omit<
  Octane.ButtonHTMLAttributes<HTMLButtonElement>,
  | "className"
  | "value"
  | "id"
  | "role"
  | "type"
  | "aria-selected"
  | "aria-controls"
> {
  value: string;
}

export function Tab({
  value,
  children,
  disabled,
  onClick,
  ...rest
}: TabProps) @{
  const tabs = useTabs();
  const selected = tabs.value === value;
  const key = encodeURIComponent(value);

  function handleClick(event: MouseEvent & {
    currentTarget: HTMLButtonElement;
  }) {
    onClick?.(event);
    if (!event.defaultPrevented && !disabled) tabs.select(value);
  }

  <button
    {...rest}
    type="button"
    role="tab"
    id={`${tabs.id}-tab-${key}`}
    aria-controls={`${tabs.id}-panel-${key}`}
    aria-selected={selected}
    disabled={disabled}
    class={["tab", rest.class]}
    onClick={handleClick}
  >
    {children}
    <style>
      .tab {
        flex-shrink: 0;
        min-height: var(--control-height);
        padding: 0.35rem var(--control-padding-inline);
        border: 1px solid transparent;
        border-radius: var(--border-radius);
        background: transparent;
        color: var(--text-secondary);
        font: inherit;
        font-size: var(--control-font-size);
        cursor: pointer;
      }
      .tab:hover:not(:disabled) {
        background: var(--control-background-active);
        color: var(--control-text-primary);
      }
      .tab[aria-selected="true"] {
        background: var(--control-background-active);
        color: var(--control-text-primary);
      }
      .tab:focus-visible {
        outline: 2px solid var(--control-accent);
        outline-offset: 1px;
      }
      .tab:disabled {
        opacity: 0.55;
        cursor: not-allowed;
      }
      @media (forced-colors: active) {
        .tab[aria-selected="true"] {
          border-color: Highlight;
        }
        .tab:focus-visible {
          outline-color: Highlight;
        }
      }
    </style>
  </button>
}

export interface TabPanelProps extends Omit<
  DivProps,
  "id" | "role" | "hidden" | "aria-labelledby"
> {
  value: string;
}

export function TabPanel({ value, children, ...rest }: TabPanelProps) @{
  const tabs = useTabs();
  const key = encodeURIComponent(value);
  <div
    tabIndex={0}
    {...rest}
    role="tabpanel"
    id={`${tabs.id}-panel-${key}`}
    aria-labelledby={`${tabs.id}-tab-${key}`}
    hidden={tabs.value !== value}
    class={["panel", rest.class]}
  >
    {children}
    <style>
      .panel {
        padding-block: 1rem;
        color: var(--control-text-primary);
      }
      .panel[hidden] {
        display: none;
      }
      .panel:focus-visible {
        outline: 2px solid var(--control-accent);
        outline-offset: 2px;
        border-radius: var(--border-radius);
      }
    </style>
  </div>
}
