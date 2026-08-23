import { defineConfig } from "vite";
import { octane } from "@octanejs/vite-plugin";

export default defineConfig({
  plugins: [octane()],
  build: {
    target: "esnext",
    lib: {
      entry: "src/index.tsrx",
      fileName: "octane-ui",
      formats: ["es"],
    },
    rolldownOptions: {
      external: ["octane"],
    },
  },
});
