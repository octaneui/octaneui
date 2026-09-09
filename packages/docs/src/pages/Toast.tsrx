import { CodeExample } from "../CodeExample.tsrx";
import { ToastExamples } from "../examples/ToastExamples.tsrx";
import { ToastProviderExample } from "../examples/ToastProviderExample.tsrx";
import toastExamplesHtml from "../examples/ToastExamples.tsrx?highlight";
import toastProviderExampleHtml from "../examples/ToastProviderExample.tsrx?highlight";

export function ToastDocs() @{
  <section class="page">
    <h1 class="title">Toast</h1>
    <p class="lede">
      Transient notification with <code>success</code>, <code>warn</code>,{" "}
      <code>error</code>, and <code>info</code> variants. Use{" "}
      <code>Toast</code> for the visual, and <code>ToastProvider</code> to
      queue, position, and dismiss them.
    </p>
    <div class="preview">
      <ToastExamples />
    </div>
    <CodeExample filename="ToastExamples.tsrx" html={toastExamplesHtml} />

    <h2 class="subtitle">Provider</h2>
    <p class="lede">
      Wrap the tree in <code>ToastProvider</code>, then call{" "}
      <code>useToast()</code> to push notifications. Default duration is 4s;
      pass <code>duration=0</code> to keep a toast until it is dismissed.{" "}
      <code>contained</code> positions the stack inside this preview instead of
      the viewport.
    </p>
    <div class="preview">
      <ToastProviderExample />
    </div>
    <CodeExample
      filename="ToastProviderExample.tsrx"
      html={toastProviderExampleHtml}
    />
  </section>
}
