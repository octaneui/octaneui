const COMPONENTS = [
  { name: "Input", href: "/components/input" },
  { name: "Button", href: "/components/button" },
  { name: "Select", href: "/components/select" },
  { name: "Slider", href: "/components/slider" },
  { name: "Calendar", href: "/components/calendar" },
  { name: "Time", href: "/components/time" },
  { name: "Checkbox", href: "/components/checkbox" },
  { name: "Radio", href: "/components/radio" },
  { name: "Switch", href: "/components/switch" },
  { name: "Textarea", href: "/components/textarea" },
  { name: "Color", href: "/components/color" },
  { name: "File input", href: "/components/file-input" },
  { name: "Progress", href: "/components/progress" },
  { name: "Disclosure", href: "/components/disclosure" },
  { name: "Dialog", href: "/components/dialog" },
  { name: "Icons", href: "/icons/lucide" },
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
        border: 1px solid var(--border-color);
        border-radius: 0.9rem;
        background: var(--surface-background);
        color: var(--text-primary);
        font-weight: 600;
      }
      .link:hover {
        border-color: var(--surface-background-hover);
        background: var(--surface-background-hover);
      }
    </style>
  </section>
}
