import { Datagrid, type DatagridColumnDef } from "@octaneui/core";

interface Person {
  id: number;
  name: string;
  email: string;
  team: string;
  city: string;
  salary: number;
}

const people: Person[] = [
  {
    id: 1,
    name: "Alex Morgan",
    email: "alex@example.com",
    team: "Design",
    city: "Lisbon",
    salary: 82000,
  },
  {
    id: 2,
    name: "Sam Rivera",
    email: "sam@example.com",
    team: "Engineering",
    city: "London",
    salary: 96000,
  },
  {
    id: 3,
    name: "Jamie Chen",
    email: "jamie@example.com",
    team: "Design",
    city: "Berlin",
    salary: 88000,
  },
  {
    id: 4,
    name: "Taylor Reed",
    email: "taylor@example.com",
    team: "Operations",
    city: "Madrid",
    salary: 76000,
  },
];

const columns: DatagridColumnDef<Person>[] = [
  { id: "id", header: "ID", value: (row) => row.id, size: "4rem", pin: "left" },
  {
    id: "person",
    header: "Person",
    children: [
      {
        id: "name",
        header: "Name",
        value: (row) => row.name,
        size: "minmax(10rem, 1fr)",
        pin: "left",
      },
      {
        id: "contact",
        header: "Contact",
        children: [
          {
            id: "email",
            header: "Email",
            value: (row) => row.email,
            size: "max-content",
            cell: ({ row }) => <a href={`mailto:${row.email}`}>{row.email}</a>,
          },
          {
            id: "city",
            header: "City",
            value: (row) => row.city,
            size: "fit-content(12rem)",
          },
        ],
      },
    ],
  },
  {
    id: "work",
    header: "Work",
    children: [
      {
        id: "team",
        header: "Team",
        value: (row) => row.team,
        size: "minmax(10rem, 2fr)",
      },
      {
        id: "salary",
        header: "Salary",
        value: (row) => row.salary,
        size: "7rem",
        align: "end",
        pin: "right",
        cell: ({ row }) => `€${row.salary.toLocaleString("en-IE")}`,
      },
    ],
  },
];

export function GroupedDatagridExample() @{
  <Datagrid
    caption="People directory"
    columnDefs={columns}
    data={people}
    getRowId={(row) => row.id}
  />
}
