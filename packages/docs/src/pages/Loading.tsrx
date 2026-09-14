import { CodeExample } from "../CodeExample.tsrx";
import { LoadingIconExample } from "../examples/LoadingIconExample.tsrx";
import { LoadingLabelExample } from "../examples/LoadingLabelExample.tsrx";
import loadingIconExampleHtml from "../examples/LoadingIconExample.tsrx?highlight";
import loadingLabelExampleHtml from "../examples/LoadingLabelExample.tsrx?highlight";

export function LoadingDocs() @{
  <section class="page">
    <h1 class="title">Loading</h1>
    <p class="lede">
      Spinner for in-progress states. Render an icon alone, or pass{" "}
      <code>label</code> for a caption under the clock.
    </p>
    <h2 class="subtitle">Icon only</h2>
    <div class="preview">
      <div class="preview-row">
        <LoadingIconExample />
      </div>
    </div>
    <CodeExample
      filename="LoadingIconExample.tsrx"
      html={loadingIconExampleHtml}
    />
    <h2 class="subtitle">With label</h2>
    <div class="preview">
      <div class="preview-row">
        <LoadingLabelExample />
      </div>
    </div>
    <CodeExample
      filename="LoadingLabelExample.tsrx"
      html={loadingLabelExampleHtml}
    />
  </section>
}
