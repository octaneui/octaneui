import { CodeExample } from "../CodeExample.tsrx";
import { TextareaExamples } from "../examples/TextareaExamples.tsrx";
import textareaExamplesHtml from "../examples/TextareaExamples.tsrx?highlight";

export function TextareaDocs() @{
  <section class="page">
    <h1 class="title">Textarea</h1>
    <p class="lede">
      Native multiline field. Uses <code>field-sizing: content</code> where
      supported so the box grows with its text.
    </p>
    <div class="preview">
      <TextareaExamples />
    </div>
    <CodeExample
      filename="TextareaExamples.tsrx"
      html={textareaExamplesHtml}
    />
  </section>
}
