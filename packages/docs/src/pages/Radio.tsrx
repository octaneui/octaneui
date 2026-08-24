import { CodeExample } from "../CodeExample.tsrx";
import { RadioExamples } from "../examples/RadioExamples.tsrx";
import radioExamplesHtml from "../examples/RadioExamples.tsrx?highlight";

export function RadioDocs() @{
  <section class="page">
    <h1 class="title">Radio</h1>
    <p class="lede">
      Native radio buttons grouped with a <code>fieldset</code> via{" "}
      <code>RadioGroup</code>.
    </p>
    <div class="preview">
      <RadioExamples />
    </div>
    <CodeExample filename="RadioExamples.tsrx" html={radioExamplesHtml} />
  </section>
}
