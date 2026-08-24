import { defineConfig } from "vite";
import { octane } from "@octanejs/vite-plugin";

// This package is a source package: it publishes authored `.ts` source
// rather than precompiled Octane output. Consuming apps compile it with
// their own Octane toolchain, so there is no library build here. This
// config only exists so this package can be type-checked and, if needed,
// developed/previewed with Octane's Vite plugin.
export default defineConfig({
  plugins: [octane()],
});
