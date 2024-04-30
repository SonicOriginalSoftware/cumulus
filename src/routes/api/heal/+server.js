import { get_tables } from "$lib/server/validate_auth_tables.js"
import { up } from "@auth/d1-adapter"
import { error } from "@sveltejs/kit"

/**
 * @param {import("../../$types.js").RequestEvent} event
 */
export async function GET(event) {
  // Eventually we'll put this behind an authenticated check

  /** @type {import("@cloudflare/workers-types").D1Database} */
  const db = event.platform?.env.auth

  const tables = await get_tables(db)
  if (tables === null) {
    try {
      await up(db)
    } catch (err) {
      error(500, err)
    }
  }

  return Response.json({ status: "ok" })
}
