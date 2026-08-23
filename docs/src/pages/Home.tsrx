const COMPONENTS = [
  { name: "Input", href: "/components/input" },
  { name: "Button", href: "/components/button" },
  { name: "Select", href: "/components/select" },
];

export function Home() @{
  <section class="page">
    <h1 class="title">Octane UI</h1>
    <p class="lede">A component library for Octane.</p>
    <ul class="links">
      @for (const component of COMPONENTS; key component.href) {
        <li>
          <a class="link" href={component.href}>
            {component.name as string}
          </a>
        </li>
      }
    </ul>

    <style>
      .page {
        max-width: 42rem;
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
        display: grid;
        gap: 0.75rem;
        margin: 0;
        padding: 0;
        list-style: none;
      }
      .link {
        display: block;
        padding: 1rem;
        border: 1px solid var(--border);
        border-radius: 0.9rem;
        background: var(--surface-subtle);
        color: var(--text);
        font-weight: 600;
      }
      .link:hover {
        border-color: var(--card-hover-border);
        background: var(--card-hover-bg);
      }
    </style>
  </section>
}
