import { Button, Menu, MenuItem, MenuSeparator } from "@octaneui/core";

export function MenuDisabledExample() @{
  <>
    <Button
      command="toggle-popover"
      commandfor="file-menu"
      aria-haspopup="menu"
    >
      File
    </Button>
    <Menu id="file-menu" aria-label="File">
      <MenuItem>New</MenuItem>
      <MenuItem>Open</MenuItem>
      <MenuItem disabled>Save</MenuItem>
      <MenuSeparator />
      <MenuItem>Export</MenuItem>
    </Menu>
  </>
}
