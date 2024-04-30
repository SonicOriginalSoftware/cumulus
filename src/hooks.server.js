import { handle as auth_handle } from '$lib/auth.js'

import { building } from "$app/environment"

/** @type {import('@sveltejs/kit').Handle} */
export async function handle({ event, resolve }) {
  if (building) return resolve(event)

  if (event.url.pathname.startsWith("/auth")) {
    return auth_handle({ event, resolve })
  }

  return resolve(event)
}
