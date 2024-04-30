// See https://kit.svelte.dev/docs/types#app

import type { D1Database } from "@auth/d1-adapter"

// for information about these interfaces
declare global {
	namespace App {
		interface Platform {
			env: {
				db: D1Database
			}
			context: {
				waitUntil(promise: Promise<any>): void
			}
			caches: CacheStorage & { default: Cache }
		}
		// interface Error {}
		// interface Locals {}
		// interface PageData {}
		// interface PageState {}
	}
}

export { }

