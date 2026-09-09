import { cloudflare } from "@octanejs/adapter-cloudflare";
import { defineConfig, RenderRoute } from "@octanejs/vite-plugin";

export default defineConfig({
  adapter: cloudflare(),
  router: {
    routes: [
      new RenderRoute({
        path: "/",
        entry: ["Home", "/src/pages/Home.tsrx"],
        layout: "/src/Layout.tsrx",
      }),
      new RenderRoute({
        path: "/components/input",
        entry: ["InputDocs", "/src/pages/Input.tsrx"],
        layout: "/src/Layout.tsrx",
      }),
      new RenderRoute({
        path: "/components/button",
        entry: ["ButtonDocs", "/src/pages/Button.tsrx"],
        layout: "/src/Layout.tsrx",
      }),
      new RenderRoute({
        path: "/components/select",
        entry: ["SelectDocs", "/src/pages/Select.tsrx"],
        layout: "/src/Layout.tsrx",
      }),
      new RenderRoute({
        path: "/components/slider",
        entry: ["SliderDocs", "/src/pages/Slider.tsrx"],
        layout: "/src/Layout.tsrx",
      }),
      new RenderRoute({
        path: "/components/calendar",
        entry: ["CalendarDocs", "/src/pages/Calendar.tsrx"],
        layout: "/src/Layout.tsrx",
      }),
      new RenderRoute({
        path: "/components/time",
        entry: ["TimeDocs", "/src/pages/Time.tsrx"],
        layout: "/src/Layout.tsrx",
      }),
      new RenderRoute({
        path: "/components/checkbox",
        entry: ["CheckboxDocs", "/src/pages/Checkbox.tsrx"],
        layout: "/src/Layout.tsrx",
      }),
      new RenderRoute({
        path: "/components/radio",
        entry: ["RadioDocs", "/src/pages/Radio.tsrx"],
        layout: "/src/Layout.tsrx",
      }),
      new RenderRoute({
        path: "/components/switch",
        entry: ["SwitchDocs", "/src/pages/Switch.tsrx"],
        layout: "/src/Layout.tsrx",
      }),
      new RenderRoute({
        path: "/components/textarea",
        entry: ["TextareaDocs", "/src/pages/Textarea.tsrx"],
        layout: "/src/Layout.tsrx",
      }),
      new RenderRoute({
        path: "/components/color",
        entry: ["ColorDocs", "/src/pages/Color.tsrx"],
        layout: "/src/Layout.tsrx",
      }),
      new RenderRoute({
        path: "/components/file-input",
        entry: ["FileInputDocs", "/src/pages/FileInput.tsrx"],
        layout: "/src/Layout.tsrx",
      }),
      new RenderRoute({
        path: "/components/progress",
        entry: ["ProgressDocs", "/src/pages/Progress.tsrx"],
        layout: "/src/Layout.tsrx",
      }),
      new RenderRoute({
        path: "/components/disclosure",
        entry: ["DisclosureDocs", "/src/pages/Disclosure.tsrx"],
        layout: "/src/Layout.tsrx",
      }),
      new RenderRoute({
        path: "/components/dialog",
        entry: ["DialogDocs", "/src/pages/Dialog.tsrx"],
        layout: "/src/Layout.tsrx",
      }),
      new RenderRoute({
        path: "/components/popover",
        entry: ["PopoverDocs", "/src/pages/Popover.tsrx"],
        layout: "/src/Layout.tsrx",
      }),
      new RenderRoute({
        path: "/components/tabs",
        entry: ["TabsDocs", "/src/pages/Tabs.tsrx"],
        layout: "/src/Layout.tsrx",
      }),
      new RenderRoute({
        path: "/components/alert",
        entry: ["AlertDocs", "/src/pages/Alert.tsrx"],
        layout: "/src/Layout.tsrx",
      }),
      new RenderRoute({
        path: "/icons/lucide",
        entry: ["LucideIconsDocs", "/src/pages/Icons.tsrx"],
        layout: "/src/Layout.tsrx",
      }),
    ],
  },
  compiler: { strong: true }
});
