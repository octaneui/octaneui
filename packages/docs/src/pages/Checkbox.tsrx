import { CodeExample } from "../CodeExample.tsrx";
import { CheckboxExamples } from "../examples/CheckboxExamples.tsrx";
import checkboxExamplesHtml from "../examples/CheckboxExamples.tsrx?highlight";

export function CheckboxDocs() @{
  <section class="page">
    <h1 class="title">Checkbox</h1>
    <p class="lede">
      Native checkbox with a custom indicator. Wrap label text as children.
    </p>
    <div class="preview">
      <CheckboxExamples />
    </div>
    <CodeExample
      filename="CheckboxExamples.tsrx"
      html={checkboxExamplesHtml}
    />
  </section>
}
