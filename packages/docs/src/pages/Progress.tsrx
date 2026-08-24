import { CodeExample } from "../CodeExample.tsrx";
import { ProgressExamples } from "../examples/ProgressExamples.tsrx";
import progressExamplesHtml from "../examples/ProgressExamples.tsrx?highlight";

export function ProgressDocs() @{
  <section class="page">
    <h1 class="title">Progress</h1>
    <p class="lede">
      Native <code>progress</code> bar. Omit <code>value</code> for the
      indeterminate state.
    </p>
    <div class="preview">
      <ProgressExamples />
    </div>
    <CodeExample
      filename="ProgressExamples.tsrx"
      html={progressExamplesHtml}
    />
  </section>
}
