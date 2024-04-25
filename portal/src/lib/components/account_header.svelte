<script>
  import { signOut } from "firebase/auth"

  import { auth } from "$lib/firebase.svelte.js"
  import GithubSigninButton from "./github_signin_button.svelte"
  import GoogleSigninButton from "./google_signin_button.svelte"

  /** @type {import('firebase/auth').User}*/
  let account = $state(null)
  $inspect(account)

  auth.onAuthStateChanged((user) => {
    account = user
  })

  async function logOut() {
    try {
      await signOut(auth)
    } catch (err) {
      console.error(err)
    }
  }
</script>

<div>
  {#await auth.authStateReady()}
    <span>Awaiting authentication initialization...</span>
  {:then}
    {#if account == null}
      <GoogleSigninButton {auth} {account} />
      <GithubSigninButton />
    {:else}
      <img class="icon-size" src={account.photoURL} alt="user" />
      <span>{account.displayName}</span>
      <span>{account.email}</span>
      <span>{account.phoneNumber}</span>
      <button id="sign-out" class="ripple sign-in-button" onclick={logOut}>Log Out</button>
    {/if}
  {/await}
</div>

<style>
  div {
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
    background-color: var(--ui-tertiary);
    height: 20%;
  }
</style>
