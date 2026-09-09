import type { OctaneNode } from "octane";
import { Moon, Sun } from "@octaneui/icons/lucide";
import { OctaneUILogo } from "./OctaneUILogo.tsrx";

const SITE_TITLE = "Octane UI";

const PAGE_TITLES: Record<string, string> = {
  "/components/input": "Input",
  "/components/button": "Button",
  "/components/select": "Select",
  "/components/slider": "Slider",
  "/components/calendar": "Calendar",
  "/components/time": "Time",
  "/components/checkbox": "Checkbox",
  "/components/radio": "Radio",
  "/components/switch": "Switch",
  "/components/textarea": "Textarea",
  "/components/color": "Color",
  "/components/file-input": "File input",
  "/components/progress": "Progress",
  "/components/disclosure": "Disclosure",
  "/components/dialog": "Dialog",
  "/components/popover": "Popover",
  "/components/tabs": "Tabs",
  "/components/alert": "Alert",
  "/icons/lucide": "Icons",
};

function documentTitle(url?: string): string {
  const pathname = (url ?? "/").split("?")[0] || "/";
  const page = PAGE_TITLES[pathname];
  return page ? `${SITE_TITLE} - ${page}` : SITE_TITLE;
}

interface LayoutProps {
  children: OctaneNode;
  url?: string;
}

function toggleTheme() {
  const root = document.documentElement;
  const light = !root.classList.contains("light");
  root.classList.toggle("light", light);
  try {
    localStorage.setItem("theme", light ? "light" : "dark");
  } catch {}
}

export function Layout(props: LayoutProps) @{
  <div class="shell">
    <title>{documentTitle(props.url)}</title>
    <nav class="nav">
      <a class="nav-link" href="/" title="Octane UI"><OctaneUILogo width={16} height={16} fill="var(--text-primary)" /></a>
      <a class="nav-link" href="/components/alert">Alert</a>
      <a class="nav-link" href="/components/button">Button</a>
      <a class="nav-link" href="/components/calendar">Calendar</a>
      <a class="nav-link" href="/components/checkbox">Checkbox</a>
      <a class="nav-link" href="/components/color">Color</a>
      <a class="nav-link" href="/components/dialog">Dialog</a>
      <a class="nav-link" href="/components/disclosure">Disclosure</a>
      <a class="nav-link" href="/components/file-input">File</a>
      <a class="nav-link" href="/icons/lucide">Icons</a>
      <a class="nav-link" href="/components/input">Input</a>
      <a class="nav-link" href="/components/popover">Popover</a>
      <a class="nav-link" href="/components/progress">Progress</a>
      <a class="nav-link" href="/components/radio">Radio</a>
      <a class="nav-link" href="/components/select">Select</a>
      <a class="nav-link" href="/components/slider">Slider</a>
      <a class="nav-link" href="/components/switch">Switch</a>
      <a class="nav-link" href="/components/tabs">Tabs</a>
      <a class="nav-link" href="/components/textarea">Textarea</a>
      <a class="nav-link" href="/components/time">Time</a>
      <button
        type="button"
        class="theme-toggle"
        aria-label="Toggle theme"
        onClick={toggleTheme}
      >
        <span class="theme-icon theme-icon-sun">
          <Sun size={16} />
        </span>
        <span class="theme-icon theme-icon-moon">
          <Moon size={16} />
        </span>
      </button>
    </nav>
    <main class="main">{props.children}</main>

    <style>
      .shell {
        display: flex;
        min-height: 100dvh;
        flex-direction: column;
      }
      .nav {
        position: sticky;
        top: 0;
        z-index: 1;
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        gap: 0.65rem 1rem;
        min-height: 60px;
        padding: 0.65rem 1.5rem;
        border-bottom: 1px solid var(--border-color);
        background: var(--header-background);
        backdrop-filter: blur(8px);
      }
      .nav-link {
        color: var(--text-secondary);
        font-size: 0.9rem;
        font-weight: 500;
      }
      .nav-link:hover {
        color: var(--text-link);
      }
      .theme-toggle {
        margin-left: auto;
        display: inline-flex;
        flex-shrink: 0;
        align-items: center;
        justify-content: center;
        width: 2.25rem;
        height: 2.25rem;
        padding: 0;
        border: 0;
        border-radius: var(--border-radius);
        background: transparent;
        color: var(--text-secondary);
        cursor: pointer;
      }
      .theme-toggle:hover {
        color: var(--text-link);
      }
      .theme-toggle:focus-visible {
        outline: none;
      }
      .theme-icon {
        display: flex;
      }
      .theme-icon :where(svg) {
        display: block;
      }
      .theme-icon-moon {
        display: none;
      }
      :global(.light) .theme-icon-sun {
        display: none;
      }
      :global(.light) .theme-icon-moon {
        display: flex;
      }
      .main {
        flex: 1;
        padding: 3rem 1.5rem;
      }
    </style>
  </div>
}
