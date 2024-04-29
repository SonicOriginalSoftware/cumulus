<script>
  import { page } from "$app/stores"

  const user = $page.data.session?.user
</script>

<div>
  {#if user === null}
    <form method="POST" action="/login">
      <button type="submit" class="ripple sign-in-button">Log In</button>
    </form>
  {:else}
    <form method="POST" action="/logout">
      <img crossorigin="anonymous" class="icon-size" src={user.image} alt="user" />
      <span>{user.name}</span>
      <span>{user.email}</span>
      <button type="submit" class="ripple sign-in-button">Log Out</button>
    </form>
  {/if}
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
