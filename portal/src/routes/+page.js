import { app_name } from "$lib/index.js"

export function load() {
  return {
    title: `${app_name}`,
    description: `Landing page of cumulus`
  }
}
