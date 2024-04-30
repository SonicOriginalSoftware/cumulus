import { get_tables } from "$lib/server/validate_auth_tables.js"
import { error } from "@sveltejs/kit"

/**
 * @param {import("../../$types.js").RequestEvent} event
 */
export async function GET(event) {
  // Eventually we'll put this behind an authenticated check

  /** @type {import("@cloudflare/workers-types").D1Database} */
  const db = event.platform?.env.auth

  let tables
  try {
    tables = await get_tables(db)
  } catch (err) {
    // @ts-ignore
    error(500, err)
  }

  if (tables?.length === 0) {
    error(500, "Not at all tables exist")
  }

  return Response.json({ status: "ok", tables })
}
