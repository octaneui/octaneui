import { Button, Menu, MenuItem } from "@octaneui/core";
import { LogOut, Settings, User } from "@octaneui/icons/lucide";

export function MenuIconsExample() @{
  <>
    <Button
      command="toggle-popover"
      commandfor="account-icons-menu"
      aria-haspopup="menu"
    >
      Account
    </Button>
    <Menu id="account-icons-menu" aria-label="Account">
      <MenuItem left={<User size={16} />}>Profile</MenuItem>
      <MenuItem left={<Settings size={16} />}>Settings</MenuItem>
      <MenuItem left={<LogOut size={16} />}>Sign out</MenuItem>
    </Menu>
  </>
}
