import { useState } from "octane";
import { Tabs, TabList, Tab, TabPanel, Button } from "@octaneui/core";

export function ControlledTabsExample() @{
  const [value, setValue] = useState("overview");
  <Tabs value={value} onValueChange={setValue}>
    <TabList aria-label="Project">
      <Tab value="overview">Overview</Tab>
      <Tab value="activity">Activity</Tab>
    </TabList>
    <TabPanel value="overview">
      <Button onClick={() => setValue("activity")}>View activity</Button>
    </TabPanel>
    <TabPanel value="activity">No recent activity.</TabPanel>
  </Tabs>
}
