export type SVGElementType =
  | "circle"
  | "ellipse"
  | "line"
  | "path"
  | "polygon"
  | "polyline"
  | "rect";

export type IconNode = ReadonlyArray<
  readonly [tag: SVGElementType, attrs: Readonly<Record<string, string>>]
>;

export interface SVGAttributes {
  [key: string]: unknown;
  class?: unknown;
  className?: string;
  color?: string;
  fill?: string;
  height?: string | number;
  id?: string;
  role?: string;
  stroke?: string;
  strokeLinecap?: string;
  strokeLinejoin?: string;
  strokeWidth?: string | number;
  style?: string | Record<string, string | number | null | undefined>;
  tabIndex?: number;
  viewBox?: string;
  width?: string | number;
}

export type IconRef =
  | { current: SVGSVGElement | null }
  | ((instance: SVGSVGElement | null) => void)
  | readonly IconRef[]
  | null;

export interface LucideProps extends SVGAttributes {
  absoluteStrokeWidth?: boolean;
  children?: unknown;
  ref?: IconRef;
  size?: string | number;
}

export interface LucideIcon {
  (props: LucideProps): unknown;
  displayName?: string;
}

export interface LucideContextValue extends LucideProps {}
