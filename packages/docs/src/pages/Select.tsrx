import { CodeExample } from "../CodeExample.tsrx";
import { SelectExamples } from "../examples/SelectExamples.tsrx";
import selectExamplesHtml from "../examples/SelectExamples.tsrx?highlight";

export function SelectDocs() @{
  <section class="page">
    <h1 class="title">Select</h1>
    <p class="lede">
      Native select with a fully styled dropdown via CSS{" "}
      <code>appearance: base-select</code>. Falls back to the OS picker where
      that is not supported.
    </p>
    <div class="preview">
      <SelectExamples />
    </div>
    <CodeExample filename="SelectExamples.tsrx" html={selectExamplesHtml} />
  </section>
}
