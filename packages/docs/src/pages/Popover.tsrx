import { CodeExample } from "../CodeExample.tsrx";
import { PopoverExamples } from "../examples/PopoverExamples.tsrx";
import popoverExamplesHtml from "../examples/PopoverExamples.tsrx?highlight";

export function PopoverDocs() @{
  <section class="page">
    <h1 class="title">Popover</h1>
    <p class="lede">
      Native <code>popover</code>, anchored to its invoker. Open it with the
      Invoker Commands API (<code>command="toggle-popover"</code> +{" "}
      <code>commandfor</code>). Click outside or press Escape to dismiss — no extra
      script.
    </p>
    <div class="preview">
      <div class="preview-row">
        <PopoverExamples />
      </div>
    </div>
    <CodeExample filename="PopoverExamples.tsrx" html={popoverExamplesHtml} />
  </section>
}
