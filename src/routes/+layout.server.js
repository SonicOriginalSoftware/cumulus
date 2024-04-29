export async function load(event) {
  const session = await event.locals.auth()

  if (!session?.user?.id) {
    console.error(`No session`)
  }

  return {
    session,
  }
}
