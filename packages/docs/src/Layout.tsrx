import type { OctaneNode } from "octane";
import { Moon, Sun } from "octane-icons/lucide";

interface LayoutProps {
  children: OctaneNode;
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
    <nav class="nav">
      <a class="nav-link" href="/">Octane UI</a>
      <a class="nav-link" href="/components/input">Input</a>
      <a class="nav-link" href="/components/button">Button</a>
      <a class="nav-link" href="/components/select">Select</a>
      <a class="nav-link" href="/components/slider">Slider</a>
      <a class="nav-link" href="/components/calendar">Calendar</a>
      <a class="nav-link" href="/components/time">Time</a>
      <a class="nav-link" href="/components/checkbox">Checkbox</a>
      <a class="nav-link" href="/components/radio">Radio</a>
      <a class="nav-link" href="/components/switch">Switch</a>
      <a class="nav-link" href="/components/textarea">Textarea</a>
      <a class="nav-link" href="/components/color">Color</a>
      <a class="nav-link" href="/components/file-input">File</a>
      <a class="nav-link" href="/components/progress">Progress</a>
      <a class="nav-link" href="/components/disclosure">Disclosure</a>
      <a class="nav-link" href="/components/dialog">Dialog</a>
      <a class="nav-link" href="/icons/lucide">Icons</a>
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
        border-bottom: 1px solid var(--border);
        background: var(--header-bg);
        backdrop-filter: blur(8px);
      }
      .nav-link {
        color: var(--text-secondary);
        font-size: 0.9rem;
        font-weight: 500;
      }
      .nav-link:hover {
        color: var(--accent-text);
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
        border-radius: var(--radius);
        background: transparent;
        color: var(--text-secondary);
        cursor: pointer;
      }
      .theme-toggle:hover {
        color: var(--accent-text);
      }
      .theme-toggle:focus-visible {
        outline: none;
        box-shadow: var(--control-ring);
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
