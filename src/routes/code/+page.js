import { app_name } from "$lib"

// export const prerender = true

export function load({ params }) {
  return {
    section: app_name,
    title: `Code`,
    description: `Code repository hosting`
  }
}
