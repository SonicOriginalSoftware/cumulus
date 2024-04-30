import { D1Adapter, } from "@auth/d1-adapter"
import { SvelteKitAuth, } from "@auth/sveltekit"
import GitHub from "@auth/sveltekit/providers/github"
import Google from "@auth/sveltekit/providers/google"

const { handle, signIn, signOut } = SvelteKitAuth(async (event) => {
  return {
    providers: [Google, GitHub],
    adapter: D1Adapter(event.platform?.env.auth),
    trustHost: true,
    callbacks: {
      session: ({ newSession, session, token, user, trigger }) => {
        return session
      },
    }
  }
})

export { handle, signIn, signOut }
