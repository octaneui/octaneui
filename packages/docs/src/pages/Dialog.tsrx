import { CodeExample } from "../CodeExample.tsrx";
import { DialogExamples } from "../examples/DialogExamples.tsrx";
import dialogExamplesHtml from "../examples/DialogExamples.tsrx?highlight";

export function DialogDocs() @{
  <section class="page">
    <h1 class="title">Dialog</h1>
    <p class="lede">
      Native <code>dialog</code>. Open it with the Invoker Commands API (
      <code>command="show-modal"</code> + <code>commandfor</code>) and close it
      with <code>form method="dialog"</code> — no extra script.
    </p>
    <div class="preview">
      <div class="preview-row">
        <DialogExamples />
      </div>
    </div>
    <CodeExample filename="DialogExamples.tsrx" html={dialogExamplesHtml} />
  </section>
}
