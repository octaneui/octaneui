import { CodeExample } from "../CodeExample.tsrx";
import { TimeExamples } from "../examples/TimeExamples.tsrx";
import timeExamplesHtml from "../examples/TimeExamples.tsrx?highlight";

export function TimeDocs() @{
  <section class="page">
    <h1 class="title">Time</h1>
    <p class="lede">
      Native <code>input type="time"</code>. Use <code>step=1</code> to include
      seconds.
    </p>
    <div class="preview">
      <TimeExamples />
    </div>
    <CodeExample filename="TimeExamples.tsrx" html={timeExamplesHtml} />
  </section>
}
