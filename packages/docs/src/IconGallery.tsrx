import { useState } from "octane";
import { DynamicIcon, iconNames } from "@octaneui/icons/lucide/dynamic";
import type { IconName } from "@octaneui/icons/lucide/dynamic";

const RESULT_LIMIT = 60;
const TOTAL_ICON_COUNT = iconNames.length;

// Mirrors the generator's kebab-to-Pascal-case conversion, just for the
// copyable import snippet — not exported by the runtime package.
function toDisplayPascalCase(value: string): string {
  return value
    .split("-")
    .map((part) => part.charAt(0).toUpperCase() + part.slice(1))
    .join("");
}

export function IconGallery() @{
  const [query, setQuery] = useState("");
  const [copiedName, setCopiedName] = useState<string | null>(null);

  const trimmedQuery = query.trim().toLowerCase();
  const allMatches: IconName[] = trimmedQuery
    ? iconNames.filter((name) => name.includes(trimmedQuery))
    : [];
  const visibleMatches = allMatches.slice(0, RESULT_LIMIT);

  function copyImport(name: IconName) {
    const snippet = `import { ${toDisplayPascalCase(name)} } from "@octaneui/icons/lucide";`;
    navigator.clipboard
      ?.writeText(snippet)
      .then(() => {
        setCopiedName(name);
        setTimeout(() => {
          setCopiedName((current) => (current === name ? null : current));
        }, 1200);
      })
      .catch(() => {});
  }

  <div class="gallery">
    <input
      class="gallery-input"
      type="search"
      placeholder={`Search ${TOTAL_ICON_COUNT} icon names…`}
      value={query}
      onInput={(event) => setQuery(event.currentTarget.value)}
      aria-label="Search Lucide icons"
    />

    @if (!trimmedQuery) {
      <p class="gallery-hint">
        {`Start typing to search all ${TOTAL_ICON_COUNT} icon names, including aliases. Results load on demand, so nothing here ships in the initial page.`}
      </p>
    } @else {
      <>
        @if (allMatches.length > 0) {
          <p class="gallery-count">
            {`${allMatches.length} match${allMatches.length === 1 ? "" : "es"}`}
            @if (allMatches.length > visibleMatches.length) {
              <>{` — showing the first ${visibleMatches.length}`}</>
            }
          </p>
        }
        <ul class="gallery-grid">
          @for (const name of visibleMatches; key name) {
            <li class="gallery-item">
              <DynamicIcon
                name={name}
                size={22}
                fallback={() => <span class="gallery-placeholder" />}
              />
              <code class="gallery-name">{name as string}</code>
              <button
                type="button"
                class="gallery-copy"
                onClick={() => copyImport(name)}
              >
                {(copiedName === name ? "Copied" : "Copy import") as string}
              </button>
            </li>
          } @empty {
            <li class="gallery-hint">{`No icons match "${query}".`}</li>
          }
        </ul>
      </>
    }

    <style>
      .gallery {
        display: flex;
        flex-direction: column;
        gap: 1rem;
      }
      .gallery-input {
        box-sizing: border-box;
        width: 100%;
        min-height: 2.5rem;
        padding: 0 0.875rem;
        border: 1px solid var(--border-color);
        border-radius: var(--border-radius);
        background: var(--surface-background);
        color: var(--text-primary);
        font-family: inherit;
        font-size: 0.9375rem;
      }
      .gallery-input:focus-visible {
        outline: none;
        border-color: var(--text-primary);
      }
      .gallery-hint,
      .gallery-count {
        margin: 0;
        color: var(--text-secondary);
        font-size: 0.875rem;
      }
      .gallery-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(9.5rem, 1fr));
        gap: 0.75rem;
        margin: 0;
        padding: 0;
        list-style: none;
      }
      .gallery-item {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 0.5rem;
        padding: 1rem 0.75rem;
        border: 1px solid var(--border-color);
        border-radius: var(--border-radius);
        background: var(--surface-background);
        text-align: center;
      }
      .gallery-placeholder {
        display: block;
        width: 22px;
        height: 22px;
      }
      .gallery-name {
        overflow: hidden;
        width: 100%;
        color: var(--text-secondary);
        font-size: 0.75rem;
        text-overflow: ellipsis;
        white-space: nowrap;
      }
      .gallery-copy {
        padding: 0.3rem 0.6rem;
        border: 1px solid var(--border-color);
        border-radius: calc(var(--border-radius) - 0.2rem);
        background: transparent;
        color: var(--text-primary);
        font-family: inherit;
        font-size: 0.75rem;
        cursor: pointer;
      }
      .gallery-copy:hover {
        border-color: var(--text-primary);
        color: var(--text-link);
      }
    </style>
  </div>
}
