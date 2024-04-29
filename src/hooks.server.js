import { up } from "@auth/d1-adapter"
import { getPlatformProxy } from "wrangler"

import { handle } from "$lib/auth.js"

let migrated = false

async function detect_prerendered_path(page_path) {
  let page = { prerender: true }

  switch (page_path) {
    case 'auth/error':
    case 'logout':
    case undefined:
      page.prerender = false
      break
    case '':
      page = await import(`./routes/+page.js`)
      break
    default:
      page = await import(`./routes/${page_path}/+page.js`)
      break
  }

  return page.prerender
}

/** @type {import('@sveltejs/kit').Handle} */
async function migrations(event) {
  console.debug(`Database initializing...`)
  let errored
  try {
    await up(event.platform.env.db)
  } catch (err) {
    errored = err
  }

  if (errored) {
    console.error(errored)
  } else {
    console.debug(`Database initialized!`)
    migrated = true
  }
}

/** @type {import('@sveltejs/kit').Handle} */
export async function handle({ event, resolve }) {
  if (await detect_prerendered_path(event.route.id?.slice(1))) return resolve(event)

  if (event.platform === undefined) event.platform = await getPlatformProxy()

  if (!migrated) await migrations(event)

  return handle({ event, resolve })
}
