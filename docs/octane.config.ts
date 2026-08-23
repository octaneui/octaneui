import { defineConfig, RenderRoute } from "@octanejs/vite-plugin";

export default defineConfig({
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
    ],
  },
});
