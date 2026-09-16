import { useState } from "octane";
import {
  Button,
  Datagrid,
  Input,
  Pagination,
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
  { id: 5, name: "Riley Patel", team: "Engineering", city: "Dublin" },
  { id: 6, name: "Casey Bloom", team: "Design", city: "Paris" },
  { id: 7, name: "Morgan Lee", team: "Operations", city: "Vienna" },
  { id: 8, name: "Avery Shah", team: "Engineering", city: "Amsterdam" },
  { id: 9, name: "Quinn Park", team: "Design", city: "Oslo" },
  { id: 10, name: "Jordan Cole", team: "Operations", city: "Rome" },
];

const columns: DatagridColumnDef<Person>[] = [
  {
    id: "name",
    header: "Name",
    value: (row) => row.name,
    size: "minmax(8rem, 2fr)",
  },
  {
    id: "team",
    header: "Team",
    value: (row) => row.team,
    size: "minmax(7rem, 1fr)",
  },
  { id: "city", header: "City", value: (row) => row.city, size: "25%" },
];

const PAGE_SIZE = 3;

export function ControlledDatagridExample() @{
  const [query, setQuery] = useState("");
  const [descending, setDescending] = useState(false);
  const [page, setPage] = useState(1);
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
  const pageCount = Math.max(1, Math.ceil(visiblePeople.length / PAGE_SIZE));
  const currentPage = Math.min(page, pageCount);
  const pagedPeople = visiblePeople.slice(
    (currentPage - 1) * PAGE_SIZE,
    currentPage * PAGE_SIZE,
  );

  <>
    <Input
      aria-label="Filter people"
      placeholder="Filter by name, team, or city"
      value={query}
      onInput={(event) => {
        setQuery(event.currentTarget.value);
        setPage(1);
      }}
    />
    <Button onClick={() => setDescending(!descending)}>
      Name:
      {descending ? "Z–A" : "A–Z"}
    </Button>
    <Datagrid
      aria-label="Filtered people"
      columnDefs={columns}
      data={pagedPeople}
      getRowId={(row) => row.id}
      emptyContent="No people match your filter."
    />
    <Pagination
      count={pageCount}
      page={currentPage}
      onPageChange={setPage}
      aria-label="People pages"
    />
  </>
}
