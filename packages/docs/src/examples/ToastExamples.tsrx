import { Toast } from "@octaneui/core";
import {
  CircleCheck,
  CircleX,
  Info,
  TriangleAlert,
  X,
} from "@octaneui/icons/lucide";

export function ToastExamples() @{
  <div class="stack">
    <Toast variant="success" left={<CircleCheck size={16} />}>
      Your changes have been saved.
    </Toast>
    <Toast variant="warn" left={<TriangleAlert size={16} />}>
      Your session expires in 5 minutes.
    </Toast>
    <Toast variant="error" left={<CircleX size={16} />}>
      Could not connect to the server.
    </Toast>
    <Toast variant="info" left={<Info size={16} />} right={<X size={16} />}>
      A new version is available.
    </Toast>

    <style>
      .stack {
        display: flex;
        flex-direction: column;
        gap: 0.75rem;
        width: 100%;
      }
    </style>
  </div>
}
