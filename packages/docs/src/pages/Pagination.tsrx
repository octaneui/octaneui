import { CodeExample } from "../CodeExample.tsrx";
import { PaginationExamples } from "../examples/PaginationExamples.tsrx";
import paginationExamplesHtml from "../examples/PaginationExamples.tsrx?highlight";

export function PaginationDocs() @{
  <section class="page">
    <h1 class="title">Pagination</h1>
    <p class="lede">
      Page controls for lists and tables. First and last pages stay visible,
      with ellipses for the pages in between.
    </p>
    <div class="preview">
      <PaginationExamples />
    </div>
    <CodeExample
      filename="PaginationExamples.tsrx"
      html={paginationExamplesHtml}
    />
    <h2 class="subtitle">Usage</h2>
    <p>
      Set <code>count</code> to the number of pages. Use <code>defaultPage</code> for local state, or <code>page</code> and <code>onPageChange</code> to control it. Give the control an accessible name with <code>aria-label</code> or <code>aria-labelledby</code> when more than one pagination is on the page.
    </p>
    <p>
      Slice the rows you pass to <code>Datagrid</code> (or any list) from the current page. Customize the previous and next buttons with <code>previous</code> and <code>next</code>.
    </p>
  </section>
}
