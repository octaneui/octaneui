import { Tabs, TabList, Tab, TabPanel, Input } from "@octaneui/core";

export function TabsExamples() @{
  <Tabs defaultValue="profile">
    <TabList aria-label="Account settings">
      <Tab value="profile">Profile</Tab>
      <Tab value="security">Security</Tab>
      <Tab value="billing" disabled>Billing</Tab>
    </TabList>
    <TabPanel value="profile">
      <Input aria-label="Display name" placeholder="Display name" />
    </TabPanel>
    <TabPanel value="security">
      Manage your password and sign-in preferences.
    </TabPanel>
    <TabPanel value="billing">Manage your subscription.</TabPanel>
  </Tabs>
}
