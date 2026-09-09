import type { LucideIcon } from "@octaneui/icons/lucide";
import {
  AppWindow,
  Calendar,
  ChevronsDownUp,
  ChevronsUpDown,
  CircleDot,
  Clock,
  FileUp,
  LoaderCircle,
  Palette,
  RectangleEllipsis,
  SlidersHorizontal,
  Sparkles,
  SquareCheck,
  TextAlignStart,
  TextCursorInput,
  ToggleLeft,
} from "@octaneui/icons/lucide";
import { CodeExample } from "../CodeExample.tsrx";
import installHtml from "../examples/Install.sh?highlight";
import installStylesHtml from "../examples/InstallStyles.css?highlight";

const COMPONENTS: { name: string; href: string; Icon: LucideIcon }[] = [
  { name: "Input", href: "/components/input", Icon: TextCursorInput },
  { name: "Button", href: "/components/button", Icon: RectangleEllipsis },
  { name: "Select", href: "/components/select", Icon: ChevronsUpDown },
  { name: "Slider", href: "/components/slider", Icon: SlidersHorizontal },
  { name: "Calendar", href: "/components/calendar", Icon: Calendar },
  { name: "Time", href: "/components/time", Icon: Clock },
  { name: "Checkbox", href: "/components/checkbox", Icon: SquareCheck },
  { name: "Radio", href: "/components/radio", Icon: CircleDot },
  { name: "Switch", href: "/components/switch", Icon: ToggleLeft },
  { name: "Textarea", href: "/components/textarea", Icon: TextAlignStart },
  { name: "Color", href: "/components/color", Icon: Palette },
  { name: "File input", href: "/components/file-input", Icon: FileUp },
  { name: "Progress", href: "/components/progress", Icon: LoaderCircle },
  { name: "Disclosure", href: "/components/disclosure", Icon: ChevronsDownUp },
  { name: "Dialog", href: "/components/dialog", Icon: AppWindow },
  { name: "Icons", href: "/icons/lucide", Icon: Sparkles },
];

export function Home() @{
  <section class="page">
    <h1 class="title">Octane UI</h1>
    <p class="lede">A component library for Octane.</p>

    <h2 class="subtitle">Install</h2>
    <p class="lede">
      Add the library and Octane, then import the theme stylesheet so components
      pick up default tokens.
    </p>
    <CodeExample filename="Terminal" html={installHtml} />
    <CodeExample filename="styles.css" html={installStylesHtml} />

    <h2 class="subtitle">Components</h2>
    <ul class="links">
      @for (const component of COMPONENTS; key component.href) {
        <li>
          <a class="link" href={component.href}>
            <component.Icon size={18} />
            {component.name as string}
          </a>
        </li>
      }
    </ul>

    <style>
      .page {
        max-width: 48rem;
        margin: 0 auto;
      }
      .title {
        margin: 0 0 0.75rem;
        font-size: 2.5rem;
        letter-spacing: -0.03em;
      }
      .lede {
        margin: 0 0 1.5rem;
        color: var(--text-secondary);
        font-size: 1.15rem;
      }
      .links {
        display: flex;
        flex-wrap: wrap;
        gap: 0.65rem;
        margin: 0;
        padding: 0;
        list-style: none;
      }
      .link {
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
        padding: 0.7rem 0.9rem;
        border: 1px solid var(--border-color);
        border-radius: 0.9rem;
        background: var(--surface-background);
        color: var(--text-primary);
        font-weight: 600;
        white-space: nowrap;
      }
      .link:hover {
        border-color: var(--surface-background-hover);
        background: var(--surface-background-hover);
      }
      .link :where(svg) {
        flex-shrink: 0;
        display: block;
      }
    </style>
  </section>
}
