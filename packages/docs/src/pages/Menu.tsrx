import { CodeExample } from "../CodeExample.tsrx";
import { MenuExamples } from "../examples/MenuExamples.tsrx";
import { MenuIconsExample } from "../examples/MenuIconsExample.tsrx";
import { MenuDisabledExample } from "../examples/MenuDisabledExample.tsrx";
import { MenuActionsExample } from "../examples/MenuActionsExample.tsrx";
import menuExamplesHtml from "../examples/MenuExamples.tsrx?highlight";
import menuIconsExampleHtml from "../examples/MenuIconsExample.tsrx?highlight";
import menuDisabledExampleHtml from "../examples/MenuDisabledExample.tsrx?highlight";
import menuActionsExampleHtml from "../examples/MenuActionsExample.tsrx?highlight";

export function MenuDocs() @{
  <section class="page">
    <h1 class="title">Menu</h1>
    <p class="lede">
      Action list on a native <code>popover</code>, anchored to its invoker.
      Open it with <code>command="toggle-popover"</code> +{" "}
      <code>commandfor</code>. Arrow keys move between items; click, Enter, or
      Escape dismisses.
    </p>
    <div class="preview">
      <div class="preview-row">
        <MenuExamples />
      </div>
    </div>
    <CodeExample filename="MenuExamples.tsrx" html={menuExamplesHtml} />

    <h2 class="subtitle">Icons</h2>
    <div class="preview">
      <div class="preview-row">
        <MenuIconsExample />
      </div>
    </div>
    <CodeExample
      filename="MenuIconsExample.tsrx"
      html={menuIconsExampleHtml}
    />

    <h2 class="subtitle">Separators and disabled items</h2>
    <div class="preview">
      <div class="preview-row">
        <MenuDisabledExample />
      </div>
    </div>
    <CodeExample
      filename="MenuDisabledExample.tsrx"
      html={menuDisabledExampleHtml}
    />

    <h2 class="subtitle">Actions</h2>
    <p class="lede">
      Handle <code>onClick</code> on a <code>MenuItem</code> to run an action.
      The menu closes after a successful click unless you{" "}
      <code>preventDefault()</code>.
    </p>
    <div class="preview">
      <MenuActionsExample />
    </div>
    <CodeExample
      filename="MenuActionsExample.tsrx"
      html={menuActionsExampleHtml}
    />
  </section>
}
