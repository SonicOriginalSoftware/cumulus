<script>
  import GithubSigninButton from "$lib/components/github_signin_button.svelte"
  import GoogleSigninButton from "$lib/components/google_signin_button.svelte"
</script>

<form method="POST" action="/login" use:enhance>
  <GoogleSigninButton />
  <GithubSigninButton />
</form>
