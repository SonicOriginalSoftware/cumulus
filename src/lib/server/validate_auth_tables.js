/** @param {import("@cloudflare/workers-types").D1Database} db */
export async function get_tables(db) {
  const statement = db.prepare("PRAGMA table_list")

  const { success, results } = await statement.all()

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
