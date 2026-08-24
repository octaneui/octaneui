import { CodeExample } from "../CodeExample.tsrx";
import { InputExamples } from "../examples/InputExamples.tsrx";
import inputExamplesHtml from "../examples/InputExamples.tsrx?highlight";

export function InputDocs() @{
  <section class="page">
    <h1 class="title">Input</h1>
    <p class="lede">
      Text field with optional left and right slots for icons, prefixes, or
      suffixes.
    </p>
    <div class="preview">
      <InputExamples />
    </div>
    <CodeExample filename="InputExamples.tsrx" html={inputExamplesHtml} />
  </section>
}
