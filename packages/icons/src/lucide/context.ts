import { createContext, createElement, useContext } from "octane";

import type { LucideContextValue, LucideProps } from "./types";

const LucideContext = createContext<LucideContextValue>({});

export interface LucideProviderProps extends LucideProps {
  children?: unknown;
}

// Intentionally does not memoize the context value: `useMemo`'s hook-slot
// storage is only wired up for components a compiled `.tsrx` render pass
// frames itself, and this file authors a plain, uncompiled component (like
// the rest of this package) so it renders identically un-bundled, in tests,
// and across Octane's client/server runtimes. Building a fresh plain object
// per render is cheap and keeps this provider correct in every environment.
export function LucideProvider({
  children,
  size,
  color,
  strokeWidth,
  absoluteStrokeWidth,
  class: classValue,
  className,
}: LucideProviderProps) {
  const value: LucideContextValue = {
    size,
    color,
    strokeWidth,
    absoluteStrokeWidth,
    class: classValue,
    className,
  };
  return createElement(LucideContext.Provider, { value, children });
}

export function useLucideContext(): LucideContextValue {
  return useContext(LucideContext);
}
