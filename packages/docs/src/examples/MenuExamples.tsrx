import { Button, Menu, MenuItem } from "@octaneui/core";

export function MenuExamples() @{
  <>
    <Button
      command="toggle-popover"
      commandfor="account-menu"
      aria-haspopup="menu"
    >
      Account
    </Button>
    <Menu id="account-menu" aria-label="Account">
      <MenuItem>Profile</MenuItem>
      <MenuItem>Settings</MenuItem>
      <MenuItem>Sign out</MenuItem>
    </Menu>
  </>
}
