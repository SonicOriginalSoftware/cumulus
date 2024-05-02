<script>
  /** @type {{user: import("@auth/sveltekit").User}}*/
  const { user } = $props()
</script>

{#if user === null}
  <form method="POST" action="/login">
    <button type="submit" class="ripple">Log In</button>
  </form>
{:else}
  <form method="POST" action="/logout">
    <div id="user-info-container">
      <img class="icon-size" src={user.image} alt="user" />
      <div id="user-info">
        <span>{user.name}</span>
        <span>{user.email}</span>
      </div>
    </div>
    <button type="submit" class="ripple">Log Out</button>
  </form>
{/if}

<style>
  #user-info-container {
    display: flex;
    justify-content: center;
    width: 100%;
    margin: 16px 0;
  }

  #user-info {
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
    padding: 0 10px 0 0;
  }

  form {
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
    align-items: center;
    height: 20%;
    color: var(--background);
    background-color: var(--ui-tertiary);
  }

  button {
    width: 100%;
    padding: 12px 0;
    border: none;
    border-radius: 6px;
    background: var(--ui-primary);
    color: var(--light-foreground);
  }

  img {
    height: 5vh;
    width: 5vh;
    padding: 0 10px;
  }
</style>
