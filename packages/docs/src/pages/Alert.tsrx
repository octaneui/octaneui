import { CodeExample } from "../CodeExample.tsrx";
import { AlertExamples } from "../examples/AlertExamples.tsrx";
import alertExamplesHtml from "../examples/AlertExamples.tsrx?highlight";

export function AlertDocs() @{
  <section class="page">
    <h1 class="title">Alert</h1>
    <p class="lede">
      Status banner with <code>success</code>, <code>warn</code>,{" "}
      <code>error</code>, and <code>info</code> variants. Pass icons or actions
      through optional <code>left</code> and <code>right</code> slots.
    </p>
    <div class="preview">
      <AlertExamples />
    </div>
    <CodeExample filename="AlertExamples.tsrx" html={alertExamplesHtml} />
  </section>
}
