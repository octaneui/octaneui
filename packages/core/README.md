# Octane UI theming

Import `@octaneui/core/styles.css`, then override its CSS custom properties in your stylesheet. The default theme is dark; apply `.light` to the document root or a container for the light theme. Both theme blocks explicitly declare the complete variable set in the same order with the same comments and non-color values; the light theme does not rely on inherited defaults.

Names follow `--scope-property-state`: the scope identifies the page, shared controls, or a specific component; the property explains what changes; an optional state such as `hover` or `focus` comes last. Words such as `background`, `text`, and `padding` are spelled out. `--control-accent` is the shared blue selection/progress color in both themes.

```css
@import "@octaneui/core/styles.css";

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
| `--control-background` | Default control background, also used by dialogs, popovers, and disclosures. |
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
| `--alert-success-background` | Success alert fill. |
| `--alert-success-border` | Success alert border. |
| `--alert-success-text` | Success alert text and icons. |
| `--alert-warn-background` | Warn alert fill. |
| `--alert-warn-border` | Warn alert border. |
| `--alert-warn-text` | Warn alert text and icons. |
| `--alert-error-background` | Error alert fill. |
| `--alert-error-border` | Error alert border. |
| `--alert-error-text` | Error alert text and icons. |
| `--alert-info-background` | Info alert fill. |
| `--alert-info-border` | Info alert border. |
| `--alert-info-text` | Info alert text and icons. |
