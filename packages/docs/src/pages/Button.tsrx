import { CodeExample } from "../CodeExample.tsrx";
import { ButtonExamples } from "../examples/ButtonExamples.tsrx";
import { ButtonSizeExample } from "../examples/ButtonSizeExample.tsrx";
import { ButtonVariantExample } from "../examples/ButtonVariantExample.tsrx";
import buttonExamplesHtml from "../examples/ButtonExamples.tsrx?highlight";
import buttonSizeExampleHtml from "../examples/ButtonSizeExample.tsrx?highlight";
import buttonVariantExampleHtml from "../examples/ButtonVariantExample.tsrx?highlight";

export function ButtonDocs() @{
  <section class="page">
    <h1 class="title">Button</h1>
    <p class="lede">
      Button with optional left and right slots for icons or extra labels. Use{" "}
      <code>variant</code> for <code>primary</code> (default),{" "}
      <code>secondary</code>, or <code>ghost</code>, and <code>size</code> for{" "}
      <code>normal</code> (default) or <code>compact</code>.
    </p>
    <div class="preview">
      <div class="preview-row">
        <ButtonExamples />
      </div>
    </div>
    <CodeExample filename="ButtonExamples.tsrx" html={buttonExamplesHtml} />

    <h2 class="subtitle">Variants</h2>
    <div class="preview">
      <div class="preview-row">
        <ButtonVariantExample />
      </div>
    </div>
    <CodeExample
      filename="ButtonVariantExample.tsrx"
      html={buttonVariantExampleHtml}
    />

    <h2 class="subtitle">Sizes</h2>
    <div class="preview">
      <div class="preview-row">
        <ButtonSizeExample />
      </div>
    </div>
    <CodeExample
      filename="ButtonSizeExample.tsrx"
      html={buttonSizeExampleHtml}
    />
  </section>
}
