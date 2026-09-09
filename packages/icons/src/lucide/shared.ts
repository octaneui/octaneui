export function mergeClasses(...classes: Array<string | undefined>): string {
  return classes
    .filter(
      (className, index, array): className is string =>
        className != null &&
        className.trim() !== "" &&
        array.indexOf(className) === index,
    )
    .join(" ")
    .trim();
}

export function hasA11yProp(props: Record<string, unknown>): boolean {
  for (const prop in props) {
    if (prop.startsWith("aria-") || prop === "role" || prop === "title") {
      return true;
    }
  }
  return false;
}

export function toCamelCase(value: string): string {
  return value.replace(/^([A-Z])|[\s-_]+(\w)/g, (_match, first, following) =>
    following ? following.toUpperCase() : first.toLowerCase(),
  );
}

export function toPascalCase(value: string): string {
  const camelCase = toCamelCase(value);
  return camelCase.charAt(0).toUpperCase() + camelCase.slice(1);
}

export function toKebabCase(value: string): string {
  return value.replace(/([a-z0-9])([A-Z])/g, "$1-$2").toLowerCase();
}
