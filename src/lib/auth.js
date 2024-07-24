import { D1Adapter, } from "@auth/d1-adapter"
import { SvelteKitAuth } from "@auth/sveltekit"
import GitHub from "@auth/sveltekit/providers/github"
import Google from "@auth/sveltekit/providers/google"

const { handle, signIn, signOut } = SvelteKitAuth(async (event) => {
  return {
    providers: [
      Google({
        account(tokens) {
          // const dummy = tokens.scope
          const extra_scopes = tokens.scope
          return {
            ...tokens
          }
        },
        profile(profile, tokens) {
          return {
            id: profile.sub,
            name: profile.name,
            role: profile.role ?? "user",
            email: profile.email,
            image: profile.picture,
          }
        }
      }),
      GitHub,
    ],
    adapter: D1Adapter(event.platform?.env.auth),
    session: { strategy: "jwt" },
    trustHost: true,
    callbacks: {
      session: ({ newSession, session, token, user, trigger }) => {
        return {
          ...token,
          // @ts-ignore
          // role: user.role,
          ...session
        }
      },
    }
  }
})

export { handle, signIn, signOut }
