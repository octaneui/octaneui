import { useState } from "octane";
import { Button, Menu, MenuItem } from "@octaneui/core";

export function MenuActionsExample() @{
  const [last, setLast] = useState("None");
  <div class="stack">
    <Button
      command="toggle-popover"
      commandfor="actions-menu"
      aria-haspopup="menu"
    >
      Actions
    </Button>
    <Menu id="actions-menu" aria-label="Actions">
      <MenuItem onClick={() => setLast("Duplicate")}>Duplicate</MenuItem>
      <MenuItem onClick={() => setLast("Archive")}>Archive</MenuItem>
      <MenuItem onClick={() => setLast("Delete")}>Delete</MenuItem>
    </Menu>
    <p class="status">Last action: {last}</p>

    <style>
      .stack {
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        gap: 0.75rem;
      }
      .status {
        margin: 0;
        color: var(--text-secondary);
      }
    </style>
  </div>
}
