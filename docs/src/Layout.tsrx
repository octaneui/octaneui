import type { OctaneNode } from "octane";

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

function SunIcon() @{
  <svg
    width="16"
    height="16"
    viewBox="0 0 16 16"
    fill="none"
    aria-hidden="true"
  >
    <circle cx="8" cy="8" r="2.5" stroke="currentColor" strokeWidth="1.5" />
    <path
      d="M8 1.75v1.5M8 12.75v1.5M1.75 8h1.5M12.75 8h1.5M3.4 3.4l1.06 1.06M11.54 11.54l1.06 1.06M3.4 12.6l1.06-1.06M11.54 4.46l1.06-1.06"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
    />
  </svg>
}

function MoonIcon() @{
  <svg
    width="16"
    height="16"
    viewBox="0 0 16 16"
    fill="none"
    aria-hidden="true"
  >
    <path
      d="M13.25 9.1A5.5 5.5 0 1 1 6.9 2.75 4.4 4.4 0 0 0 13.25 9.1Z"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinejoin="round"
    />
  </svg>
}

export function Layout(props: LayoutProps) @{
  <div class="shell">
    <nav class="nav">
      <a class="nav-link" href="/">Octane UI</a>
      <a class="nav-link" href="/components/input">Input</a>
      <a class="nav-link" href="/components/button">Button</a>
      <a class="nav-link" href="/components/select">Select</a>
      <button
        type="button"
        class="theme-toggle"
        aria-label="Toggle theme"
        onClick={toggleTheme}
      >
        <span class="theme-icon theme-icon-sun">
          <SunIcon />
        </span>
        <span class="theme-icon theme-icon-moon">
          <MoonIcon />
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
        align-items: center;
        gap: 1.25rem;
        height: 60px;
        padding: 0 1.5rem;
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
