import { building } from "$app/environment"
import { handle as auth_handle } from "$lib/auth.js"

/** @type {import('@sveltejs/kit').Handle} */
export async function handle({ event, resolve }) {
  if (building) return resolve(event)

  return auth_handle({ event, resolve })
}
