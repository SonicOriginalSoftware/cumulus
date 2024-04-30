import { building } from '$app/environment'

export const prerender = false

/** @type {import('./$types').LayoutServerLoad} */
export async function load(event) {
  if (building) return {}

  let user
  if (event.locals.auth) {
    const session = await event.locals.auth()
    if (session === null) return {}

    delete session?.user?.id
    user = session.user
  }

  return { user }
}
