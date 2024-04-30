/**
 * @param {import("@cloudflare/workers-types").D1Database} db
 * @returns
 */
export async function get_tables(db) {
  const { success, results } = await db.prepare("PRAGMA table_list").all()
  if (!success) {
    return
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
