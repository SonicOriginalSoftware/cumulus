import { initialize_database } from "$lib/server/initialize_database.js"
import { get_tables } from "$lib/server/validate_auth_tables.js"
import { error } from "@sveltejs/kit"

/**
 * @param {import("../../$types.js").RequestEvent} event
 */
export async function GET(event) {
  // Eventually we'll put this behind an authenticated check

  console.debug("Checking auth database initialization...")
  /** @type {import("@cloudflare/workers-types").D1Database} */
  const db = event.platform?.env.auth

  console.debug(db)

  let tables
  try {
    tables = await get_tables(db)
  } catch (err) {
    error(500, err)
  }
  if (tables === undefined || tables === null || tables[0] === "timed out") {
    error(500, "Could not get tables")
  }

  console.debug(tables)

  if (tables?.length === 0) {
    console.debug("Initializing auth database...")
    /** @type {import('@cloudflare/workers-types').D1Result<any>[]} */
    let batched
    try {
      batched = await initialize_database(db)
    } catch (err) {
      error(500, err)
    }
    console.debug(batched)
    console.debug("Auth database initialized")
  }

  // TODO Check table info for each expected table

  return Response.json({ status: "ok" })
}
