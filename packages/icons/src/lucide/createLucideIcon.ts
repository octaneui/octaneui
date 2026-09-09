import { createElement } from "octane";

import Icon from "./Icon";
import { mergeClasses, toKebabCase, toPascalCase } from "./shared";
import type { IconNode, LucideIcon, LucideProps } from "./types";

export function createLucideIcon(iconName: string, iconNode: IconNode): LucideIcon {
  const Component = ({
    class: classValue,
    className,
    ref,
    ...props
  }: LucideProps) =>
    createElement(Icon, {
      ref,
      iconNode,
      className: mergeClasses(
        `lucide-${toKebabCase(toPascalCase(iconName))}`,
        `lucide-${iconName}`,
        classValue as string | undefined,
        className,
      ),
      ...props,
    });

  Component.displayName = toPascalCase(iconName);
  return Component;
}

export default createLucideIcon;
