import { Alert } from "@octaneui/core";
import {
  CircleCheck,
  CircleX,
  Info,
  TriangleAlert,
  X,
} from "@octaneui/icons/lucide";

export function AlertExamples() @{
  <div class="stack">
    <Alert type="success" left={<CircleCheck size={16} />}>
      Your changes have been saved.
    </Alert>
    <Alert type="warn" left={<TriangleAlert size={16} />}>
      Your session expires in 5 minutes.
    </Alert>
    <Alert type="error" left={<CircleX size={16} />}>
      Could not connect to the server.
    </Alert>
    <Alert type="info" left={<Info size={16} />} right={<X size={16} />}>
      A new version is available.
    </Alert>

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
