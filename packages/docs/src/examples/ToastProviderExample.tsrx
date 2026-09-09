import { Button, ToastProvider, useToast } from "@octaneui/core";
import {
  CircleCheck,
  CircleX,
  Info,
  TriangleAlert,
} from "@octaneui/icons/lucide";

export function ToastProviderExample() @{
  <ToastProvider position="bottom right" contained>
    <ToastTriggers />
  </ToastProvider>
}

function ToastTriggers() @{
  const { toast } = useToast();

  <div class="actions">
    <Button
      onClick={() =>
        toast({
          variant: "success",
          left: <CircleCheck size={16} />,
          children: "Your changes have been saved.",
        })
      }
    >
      Success
    </Button>
    <Button
      onClick={() =>
        toast({
          variant: "warn",
          left: <TriangleAlert size={16} />,
          children: "Your session expires in 5 minutes.",
        })
      }
    >
      Warn
    </Button>
    <Button
      onClick={() =>
        toast({
          variant: "error",
          left: <CircleX size={16} />,
          children: "Could not connect to the server.",
        })
      }
    >
      Error
    </Button>
    <Button
      onClick={() =>
        toast({
          variant: "info",
          left: <Info size={16} />,
          children: "A new version is available.",
          duration: 0,
        })
      }
    >
      Sticky info
    </Button>

    <style>
      .actions {
        display: flex;
        flex-wrap: wrap;
        gap: 0.75rem;
      }
    </style>
  </div>
}
