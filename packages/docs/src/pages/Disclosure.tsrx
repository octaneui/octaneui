import { CodeExample } from "../CodeExample.tsrx";
import { DisclosureExamples } from "../examples/DisclosureExamples.tsrx";
import disclosureExamplesHtml from "../examples/DisclosureExamples.tsrx?highlight";

export function DisclosureDocs() @{
  <section class="page">
    <h1 class="title">Disclosure</h1>
    <p class="lede">
      Native <code>details</code> / <code>summary</code> disclosure. The{" "}
      <code>open</code> attribute controls the default expanded state.
    </p>
    <div class="preview">
      <DisclosureExamples />
    </div>
    <CodeExample
      filename="DisclosureExamples.tsrx"
      html={disclosureExamplesHtml}
    />
  </section>
}
