import { CodeExample } from "../CodeExample.tsrx";
import { CalendarExamples } from "../examples/CalendarExamples.tsrx";
import calendarExamplesHtml from "../examples/CalendarExamples.tsrx?highlight";

export function CalendarDocs() @{
  <section class="page">
    <h1 class="title">Calendar</h1>
    <p class="lede">
      Native date picker via <code>input type="date"</code>. Pass{" "}
      <code>type="month"</code>, <code>type="week"</code>, or{" "}
      <code>type="datetime-local"</code> for the other built-in calendar
      pickers.
    </p>
    <div class="preview">
      <CalendarExamples />
    </div>
    <CodeExample filename="CalendarExamples.tsrx" html={calendarExamplesHtml} />
  </section>
}
