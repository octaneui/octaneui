import { CodeExample } from "../CodeExample.tsrx";
import { ButtonExamples } from "../examples/ButtonExamples.tsrx";
import buttonExamplesHtml from "../examples/ButtonExamples.tsrx?highlight";

export function ButtonDocs() @{
  <section class="page">
    <h1 class="title">Button</h1>
    <p class="lede">
      Button with optional left and right slots for icons or extra labels.
    </p>
    <div class="preview">
      <div class="preview-row">
        <ButtonExamples />
      </div>
    </div>
    <CodeExample filename="ButtonExamples.tsrx" html={buttonExamplesHtml} />
  </section>
}
