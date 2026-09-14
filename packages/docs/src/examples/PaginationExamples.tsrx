import { useState } from "octane";
import { Pagination } from "@octaneui/core";

export function PaginationExamples() @{
  const [page, setPage] = useState(1);
  <>
    Page {page} of 10
    <Pagination count={10} page={page} onPageChange={setPage} />
  </>
}
