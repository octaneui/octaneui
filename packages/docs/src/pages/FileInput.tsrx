import { CodeExample } from "../CodeExample.tsrx";
import { FileInputExamples } from "../examples/FileInputExamples.tsrx";
import fileInputExamplesHtml from "../examples/FileInputExamples.tsrx?highlight";

export function FileInputDocs() @{
  <section class="page">
    <h1 class="title">File input</h1>
    <p class="lede">
      Native <code>input type="file"</code> with a styled{" "}
      <code>::file-selector-button</code>.
    </p>
    <div class="preview">
      <FileInputExamples />
    </div>
    <CodeExample
      filename="FileInputExamples.tsrx"
      html={fileInputExamplesHtml}
    />
  </section>
}
