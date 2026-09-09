import { CodeExample } from "../CodeExample.tsrx";
import { TabsExamples } from "../examples/TabsExamples.tsrx";
import { ControlledTabsExample } from "../examples/ControlledTabsExample.tsrx";
import tabsExamplesHtml from "../examples/TabsExamples.tsrx?highlight";
import controlledTabsExampleHtml from "../examples/ControlledTabsExample.tsrx?highlight";

export function TabsDocs() @{
  <section class="page">
    <h1 class="title">Tabs</h1>
    <p class="lede">
      Organize related content into panels.
    </p>
    <div class="preview">
      <TabsExamples />
    </div>
    <CodeExample filename="TabsExamples.tsrx" html={tabsExamplesHtml} />
    <h2>Controlled selection</h2>
    <div class="preview">
      <ControlledTabsExample />
    </div>
    <CodeExample filename="ControlledTabsExample.tsrx" html={controlledTabsExampleHtml} />
    <h2>Usage</h2>
    <p>
      Set <code>defaultValue</code> for local state, or supply
      <code>value</code> and <code>onValueChange</code> to control selection. The initial and controlled values must identify an enabled tab. Each tab needs a unique value and a matching panel.
    </p>
    <p>
      Give each <code>TabList</code> an accessible name using <code>aria-label</code> or <code>aria-labelledby</code>. Tab moves between tabs, then into the selected panel.
    </p>
    <p>
      Inactive panels remain mounted and hidden, preserving input values and
      component state. IDs are generated per Tabs instance, so examples can be
      repeated or nested.
    </p>
  </section>
}
