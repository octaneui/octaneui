import { CodeExample } from "../CodeExample.tsrx";
import { ColorExamples } from "../examples/ColorExamples.tsrx";
import colorExamplesHtml from "../examples/ColorExamples.tsrx?highlight";

export function ColorDocs() @{
  <section class="page">
    <h1 class="title">Color</h1>
    <p class="lede">
      Native <code>input type="color"</code> swatch that opens the OS picker.
    </p>
    <div class="preview">
      <div class="preview-row">
        <ColorExamples />
      </div>
    </div>
    <CodeExample filename="ColorExamples.tsrx" html={colorExamplesHtml} />
  </section>
}
