interface CodeExampleProps {
  filename: string;
  html: string;
}

export function CodeExample(props: CodeExampleProps) @{
  <section class="code-example">
    <div class="code-example-header">{props.filename}</div>
    <div
      class="code-example-content"
      dangerouslySetInnerHTML={{ __html: props.html }}
    />
  </section>
}
