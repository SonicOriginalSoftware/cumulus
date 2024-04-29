import { redirect } from '@sveltejs/kit'

export async function load(event) {
  const session = await event.locals.auth()

  if (!session?.user?.id) {
    console.error(`No session`)
    const signin_url = new URL("auth/signin", `${event.url.origin}`)
    redirect(307, signin_url)
  }

  return {
    session,
  }
}
