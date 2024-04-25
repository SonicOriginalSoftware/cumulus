<script>
  import { auth } from "$lib/firebase.svelte.js"
  import GithubSigninButton from "./github_signin_button.svelte"
  import GoogleSigninButton from "./google_signin_button.svelte"

  let account = $state(null)

  auth.onAuthStateChanged((user) => {
    account = user
  })
</script>

<div>
  {#await auth.authStateReady()}
    <span>Awaiting authentication initialization...</span>
  {:then}
    {#if account == null}
      <button id="sign-in-with-google" class="ripple">
        <GoogleSigninButton />
        Sign in with Google
      </button>
      <button id="sign-in-with-github" class="ripple">
        <GithubSigninButton />
        Sign in with GitHub
      </button>
    {:else}
      <span>Current User: {auth.currentUser}</span>
    {/if}
  {/await}
</div>

<style>
  div {
    display: flex;
    flex-direction: column;
    background-color: var(--ui-tertiary);
    width: 100%;
    height: 20%;
  }

  button {
    cursor: pointer;
    background: var(--ui-primary);
    color: var(--foreground);
    border-radius: 6px;
    border: none;
    outline: none;
    display: flex;
    align-items: center;
    max-height: 20%;
    margin: 5% 10%;
    justify-content: center;
  }
</style>
