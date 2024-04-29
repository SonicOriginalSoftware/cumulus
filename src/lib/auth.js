import { D1Adapter, } from "@auth/d1-adapter"
import { SvelteKitAuth, } from "@auth/sveltekit"
import GitHub from "@auth/sveltekit/providers/github"
import Google from "@auth/sveltekit/providers/google"

const { handle, signIn, signOut } = SvelteKitAuth(async (event) => {
  return {
    // debug: true,
    providers: [
      Google,
      GitHub],
    adapter: D1Adapter(event.platform?.env.db),
    callbacks: {
      session: ({ newSession, session, token, user, trigger }) => {
        return session
      },
      jwt: async ({ account, token, user, profile, session, trigger }) => {
        console.debug(trigger)
        console.debug(account)
        console.debug(token)
        console.debug(user)
        console.debug(profile)
        console.debug(session)
      }
    }
  }
})

export { handle, signIn, signOut }
