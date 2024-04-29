import { up } from "@auth/d1-adapter"
import { getPlatformProxy } from "wrangler"

import { building } from "$app/environment"
import { handle } from "$lib/auth.js"

const platform = await getPlatformProxy()
export const db = platform.env.db
await migrate(db)

/** @type {import('@sveltejs/kit').Handle} */
async function migrate(db) {
  console.debug(`Database initializing...`)
  let errored
  try {
    await up(db)
  } catch (err) {
    errored = err
  }

  if (errored) {
    console.error(errored)
  } else {
    console.debug(`Database initialized!`)
  }
}

/** @type {import('@sveltejs/kit').Handle} */
export async function handle({ event, resolve }) {
  if (building) return resolve(event)

  return handle({ event, resolve })
}
