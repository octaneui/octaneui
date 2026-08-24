import { Button, Dialog } from "octane-ui";

export function DialogExamples() @{
  <>
    <Button command="show-modal" commandfor="demo-dialog">
      Open dialog
    </Button>
    <Dialog id="demo-dialog" aria-labelledby="demo-dialog-title">
      <h2 id="demo-dialog-title" class="dialog-title">
        Discard draft?
      </h2>
      <p class="dialog-copy">
        This cannot be undone. Your unpublished changes will be lost.
      </p>
      <div class="dialog-actions">
        <form method="dialog">
          <Button>Cancel</Button>
        </form>
        <form method="dialog">
          <Button>Discard</Button>
        </form>
      </div>
    </Dialog>
  </>
}
