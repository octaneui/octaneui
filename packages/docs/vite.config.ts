import { defineConfig } from "vite";
import { octane } from "@octanejs/vite-plugin";
import { tsrxHighlight } from "./tsrx-highlight.ts";

export default defineConfig({
  plugins: [tsrxHighlight(), octane()],
  build: { target: "esnext" },
});
