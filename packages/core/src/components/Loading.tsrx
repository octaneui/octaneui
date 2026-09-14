import type { Octane } from "octane/jsx-runtime";
import type { OctaneNode } from "octane";
import { SpinningClock } from "./SpinningClock.tsrx";

export interface LoadingProps extends Octane.HTMLAttributes<HTMLDivElement> {
  label?: OctaneNode;
}
export function Loading({ label, ...rest }: LoadingProps) @{
  <div {...rest} class={["root", rest.class]}>
    <SpinningClock width={24} height={24} aria-hidden="true" />
    @if (label) {
      <span class="label">{label}</span>
    }

    <style>
      .root {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        gap: 0.375rem;
      }
      .label {
        font-size: 0.875rem;
      }
    </style>
  </div>
}