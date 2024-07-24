const drop_statements = [
  `DROP TABLE IF EXISTS "accounts";`,
  //   `DROP TABLE IF EXISTS "sessions";`,
  `DROP TABLE IF EXISTS "users";`,
  `DROP TABLE IF EXISTS "verification_tokens";`,
]

/** @param {import("@cloudflare/workers-types").D1Database} db */
export async function drop_database(db) {
  return db.batch(drop_statements.map(each_statement => db.prepare(each_statement)))
}
