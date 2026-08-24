import { CodeExample } from "../CodeExample.tsrx";
import { SwitchExamples } from "../examples/SwitchExamples.tsrx";
import switchExamplesHtml from "../examples/SwitchExamples.tsrx?highlight";

export function SwitchDocs() @{
  <section class="page">
    <h1 class="title">Switch</h1>
    <p class="lede">
      On/off control built on a native checkbox with <code>role="switch"</code>.
    </p>
    <div class="preview">
      <SwitchExamples />
    </div>
    <CodeExample filename="SwitchExamples.tsrx" html={switchExamplesHtml} />
  </section>
}
