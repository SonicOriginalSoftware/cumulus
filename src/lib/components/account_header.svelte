<script>
  import { page } from "$app/stores"

  let account = $state($page.data.session?.user)
  $inspect(account)
</script>

<div>
  <form method="POST" action="/logout">
    <!-- <img class="icon-size" src={account.photoURL} alt="user" /> -->
    <!-- <span>{account.displayName}</span> -->
    <!-- <span>{account.email}</span> -->
    <!-- <span>{account.phoneNumber}</span> -->
    <button type="submit" class="ripple sign-in-button">Log Out</button>
  </form>
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
