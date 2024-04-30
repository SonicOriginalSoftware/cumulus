/**
 * @param {import("@cloudflare/workers-types").D1Database} db
 * @returns
 */
export async function get_tables(db) {
  const timeout = new Promise((res) => setTimeout(() => res({ success: false, results: ["timed out"] }), 5000))
  const statement = db.prepare("PRAGMA table_list").all()

  const { success, results } = await Promise.race([timeout, statement])

  if (!success) {
    return results
  }

  let tables = []
  for (const each_table of results) {
    switch (each_table.name) {
      case "_cf_KV":
      case "sqlite_schema":
      case "sqlite_temp_schema":
        break
      default:
        tables.push(each_table)
        break
    }
  }

  return tables
}
