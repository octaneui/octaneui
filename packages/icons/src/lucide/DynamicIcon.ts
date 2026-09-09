import { createElement, useEffect, useState } from "octane";

import Icon from "./Icon";
import dynamicIconImports from "./dynamicIconImports";
import type { IconName } from "./dynamicIconImports";
import type { IconNode, LucideProps } from "./types";

const STATE_SLOT = Symbol.for("@octaneui/icons:DynamicIcon:iconNode");
const EFFECT_SLOT = Symbol.for("@octaneui/icons:DynamicIcon:load");

export interface DynamicIconProps extends LucideProps {
  name: IconName;
  fallback?: ((props: Record<string, never>) => unknown) | null;
}

export const iconNames = Object.keys(dynamicIconImports) as IconName[];

async function loadIconNode(name: IconName): Promise<IconNode> {
  if (!(name in dynamicIconImports)) {
    throw new Error(`[@octaneui/icons]: icon "${name}" was not found`);
  }
  const module = await dynamicIconImports[name]();
  return module.iconNode;
}

export function DynamicIcon({ name, fallback: Fallback, ...props }: DynamicIconProps) {
  const [iconNode, setIconNode] = useState<IconNode | undefined>(
    undefined,
    STATE_SLOT,
  );

  useEffect(
    () => {
      let cancelled = false;
      loadIconNode(name)
        .then((node) => {
          if (!cancelled) setIconNode(node);
        })
        .catch((error: unknown) => {
          console.error(error);
        });
      return () => {
        cancelled = true;
      };
    },
    [name],
    EFFECT_SLOT,
  );

  if (iconNode == null) {
    return Fallback == null ? null : createElement(Fallback as any, {});
  }

  return createElement(Icon, { ...props, iconNode });
}

export default DynamicIcon;
