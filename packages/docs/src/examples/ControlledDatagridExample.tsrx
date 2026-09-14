import { useState } from "octane";
import {
  Button,
  Datagrid,
  Input,
  type DatagridColumnDef,
} from "@octaneui/core";

interface Person {
  id: number;
  name: string;
  team: string;
  city: string;
}

const people: Person[] = [
  { id: 1, name: "Alex Morgan", team: "Design", city: "Lisbon" },
  { id: 2, name: "Sam Rivera", team: "Engineering", city: "London" },
  { id: 3, name: "Jamie Chen", team: "Design", city: "Berlin" },
  { id: 4, name: "Taylor Reed", team: "Operations", city: "Madrid" },
];

const columns: DatagridColumnDef<Person>[] = [
  { id: "name", header: "Name", field: "name", size: "minmax(8rem, 2fr)" },
  { id: "team", header: "Team", field: "team", size: "minmax(7rem, 1fr)" },
  { id: "city", header: "City", field: "city", size: "25%" },
];

export function ControlledDatagridExample() @{
  const [query, setQuery] = useState("");
  const [descending, setDescending] = useState(false);
  const visiblePeople = people.filter(
    (person) =>
      `${person.name} ${person.team} ${person.city}`.toLowerCase().includes(
        query.toLowerCase(),
      ),
  ).sort(
    (a, b) => descending
      ? b.name.localeCompare(a.name)
      : a.name.localeCompare(b.name),
  );

  <>
    <Input
      aria-label="Filter people"
      placeholder="Filter by name, team, or city"
      value={query}
      onInput={(event) => setQuery(event.currentTarget.value)}
    />
    <Button onClick={() => setDescending(!descending)}>
      Name:
      {descending ? "Z–A" : "A–Z"}
    </Button>
    <Datagrid
      aria-label="Filtered people"
      columnDefs={columns}
      data={visiblePeople}
      getRowId={(row) => row.id}
      emptyContent="No people match your filter."
    />
  </>
}
