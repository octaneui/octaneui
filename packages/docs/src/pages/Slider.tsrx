import { CodeExample } from "../CodeExample.tsrx";
import { SliderExamples } from "../examples/SliderExamples.tsrx";
import sliderExamplesHtml from "../examples/SliderExamples.tsrx?highlight";

export function SliderDocs() @{
  <section class="page">
    <h1 class="title">Slider</h1>
    <p class="lede">
      Native <code>input type="range"</code> with a styled track and thumb. Tick
      marks use the native <code>list</code> + <code>datalist</code> pairing.
    </p>
    <div class="preview">
      <SliderExamples />
    </div>
    <CodeExample filename="SliderExamples.tsrx" html={sliderExamplesHtml} />
  </section>
}
