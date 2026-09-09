import { CodeExample } from "../CodeExample.tsrx";
import { IconGallery } from "../IconGallery.tsrx";
import { IconsExamples } from "../examples/IconsExamples.tsrx";
import iconsExamplesHtml from "../examples/IconsExamples.tsrx?highlight";

export function LucideIconsDocs() @{
  <section class="page">
    <h1 class="title">Icons</h1>
    <p class="lede">
      Lucide icons generated as native Octane components via{" "}
      <code>@octaneui/icons</code>. No React, no Lucide runtime, and no{" "}
      <code>@lucide/icons</code> dependency ship in the package — each icon's
      SVG data is inlined at generation time.
    </p>
    <div class="preview">
      <div class="preview-row">
        <IconsExamples />
      </div>
    </div>
    <CodeExample filename="IconsExamples.tsrx" html={iconsExamplesHtml} />

    <h2 class="subtitle">Browse icons</h2>
    <p class="lede">
      Search by canonical name or alias. Matching icons load on demand via{" "}
      <code>DynamicIcon</code>, so the full set never ships in this page's
      initial bundle.
    </p>
    <IconGallery />
  </section>
}
