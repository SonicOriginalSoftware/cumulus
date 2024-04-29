import { app_name } from "$lib"
export const prerender = false

export function load({ params }) {
  console.debug(params)

  return {
    section: app_name,
    title: `Code`,
    description: `Code repository hosting`
  }
}
