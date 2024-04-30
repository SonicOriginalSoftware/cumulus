import { long_company_name } from "$lib/index.js"

// export const prerender = true

export function load() {
  return {
    section: `Sonic Original Software`,
    title: `About`,
    description: `Learn about ${long_company_name}`
  }
}
