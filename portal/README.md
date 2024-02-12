# app

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

# TODO

- auth
  - Using the `body` as a sink for event-driven auth handling is a _bad idea_.
  We should be using a more global application state that would also contain
  application preferences to manage user-credentials
  - Until the user authentication state is populated and valid, the routing
  for the page should fall to some `/login` path rather than populating the
  `body` content directly
