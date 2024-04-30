import { handle as auth_handle } from '$lib/auth.js'
import { up } from "@auth/d1-adapter"

import { building } from "$app/environment"

let migrated = false

/** @param {import("@auth/d1-adapter").D1Database} db */
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
    migrated = true
    console.debug(`Database initialized!`)
  }
}

/** @type {import('@sveltejs/kit').Handle} */
export async function handle({ event, resolve }) {
  if (building) return resolve(event)

  if (!migrated) {
    try {
      await migrate(event.platform?.env.db)
    } catch { }
  }

  if (event.url.pathname.startsWith("/auth")) {
    return auth_handle({ event, resolve })
  }

  return resolve(event)
}
