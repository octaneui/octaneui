import type { OctaneNode } from "octane";

interface LayoutProps {
  children: OctaneNode;
}

export function Layout(props: LayoutProps) @{
  <div class="shell">
    <nav class="nav">
      <a class="nav-link" href="/">Octane UI</a>
      <a class="nav-link" href="/components/input">Input</a>
      <a class="nav-link" href="/components/button">Button</a>
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
      .main {
        flex: 1;
        padding: 3rem 1.5rem;
      }
    </style>
  </div>
}
