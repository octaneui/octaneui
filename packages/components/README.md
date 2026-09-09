# Octane UI theming

Import `octane-ui/styles.css`, then override its CSS custom properties in your stylesheet. The default theme is dark; apply `.light` to the document root or a container for the light theme. Both theme blocks explicitly declare the complete variable set in the same order with the same comments and non-color values; the light theme does not rely on inherited defaults.

Names follow `--scope-property-state`: the scope identifies the page, shared controls, or a specific component; the property explains what changes; an optional state such as `hover` or `focus` comes last. Words such as `background`, `text`, and `padding` are spelled out. `--control-accent` is the shared blue selection/progress color in both themes.

```css
@import "octane-ui/styles.css";

:root {
  --control-accent: #2f6feb;
  --control-accent-text: #fff;
  --button-background: #fff;
  --button-text: #000;
  --control-padding-inline: 1rem;
}

.light {
  --control-border-focus: #242424;
}
```

## Theme variables

| Variable | Purpose |
| --- | --- |
| `--border-radius` | Shared corner radius for controls and surfaces. |
| `--page-background` | Page background. |
| `--text-primary` | Main page text. |
| `--text-secondary` | Supporting text, including disclosure content. |
| `--text-link` | Links and navigation highlights. |
| `--border-color` | Page surface borders. |
| `--surface-background` | Cards, previews, and code containers. |
| `--surface-background-hover` | Hovered page surfaces. |
| `--control-height` | Standard single-line control height. |
| `--control-padding-inline` | Padding at the start and end of controls. |
| `--control-gap` | Space between labels, icons, and control content. |
| `--control-font-size` | Control text size. |
| `--control-background` | Default control background, also used by dialogs and disclosures. |
| `--control-background-active` | Highlighted select options (hovered, focused, or selected). |
| `--control-border` | Default control border color. |
| `--control-border-hover` | Hovered control border color. Defaults to a mix of the normal and focus borders. |
| `--control-border-focus` | Focused input border and checked radio outline. |
| `--control-text-primary` | Control labels, values, and icons. |
| `--control-placeholder-text` | Input and textarea placeholder text. |
| `--control-accent` | Checked checkbox/radio, enabled switch, progress fill, and slider fill/native accent. Defaults to blue `#2f6feb`. |
| `--control-accent-text` | Checkmark or indeterminate mark on the accent background. |
| `--control-track-background` | Unfilled slider/progress tracks and unchecked switch track. |
| `--control-thumb-background` | Slider and switch thumb background. |
| `--control-focus-shadow` | Complete `box-shadow` value for focus indicators. |
| `--button-background` | Default button background. |
| `--button-background-hover` | Hovered button background. |
| `--button-text` | Button label and icon color. |
| `--select-picker-background` | Select popup background where browser picker styling is supported. |

The docs additionally define `--header-background`. Component-local `--calendar-icon`, `--time-icon`, `--select-icon`, and `--disclosure-icon` contain CSS image URLs for masks. Shiki's `--shiki-dark` and `--shiki-light` belong to the syntax highlighter and keep its naming.

When overriding tokens inside a container, set `--control-border-hover` there too if it should derive from locally overridden borders: CSS resolves variable references where a custom property is defined.

## Renamed variables

These names replace the previous API; old aliases are not retained.

| Previous name | Replacement |
| --- | --- |
| `--control-accent-color` | `--control-accent` (blue). |
| `--control-accent-color-hover` | Removed: no component used it. |
| `--control-accent` (white) | `--button-background` for buttons, `--control-thumb-background` for thumbs, `--control-border-focus` for input focus; selection and progress now use blue `--control-accent`. |
| `--control-accent-hover` | `--button-background-hover`. |
| `--control-accent-fg` | `--button-text` for buttons; `--control-accent-text` for checkbox marks. |
| `--control-foreground` | `--control-placeholder-text`, `--control-track-background`, `--control-background-active`, or `--surface-background-hover`, according to usage. |
| `--control-strong` | `--control-border-focus`; hover border mixes now use `--control-border-hover`. |
| `--control-ring` | `--control-focus-shadow`. |
| `--control-bg` | `--control-background`. |
| `--control-picker-bg` | `--select-picker-background`. |
| `--control-pad-x` | `--control-padding-inline`. |
| `--bg` | `--page-background`. |
| `--radius` | `--border-radius`. |
| `--border` | `--border-color`. |
| `--accent-text` | `--text-link`. |
| `--surface-subtle` | `--surface-background`. |
| `--header-bg` | `--header-background` (docs). |
| `--select-chevron`, `--disclosure-chevron` | `--select-icon`, `--disclosure-icon`. |

Existing clear names such as `--control-height`, `--control-gap`, `--control-font-size`, `--control-text-primary`, `--control-border`, `--text-primary`, and `--text-secondary` remain unchanged.
