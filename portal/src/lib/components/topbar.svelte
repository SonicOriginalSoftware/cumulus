<script>
  import { page } from "$app/stores"

  let { drawer_toggle_id, drawer_shown } = $props()
</script>

<header>
  <label for={drawer_toggle_id} class="press ripple material-symbols">
    {#if drawer_shown}
      close
    {:else}
      menu
    {/if}
  </label>
  <span class="inactive" id="title">{$page.data.title}</span>
  <img src="/res/icons/logo.svg" alt="logo" />
</header>

<style>
  header {
    z-index: 1000;
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  label {
    font-size: var(--icon-dimension);
    padding: 8px;
  }

  img {
    width: var(--icon-dimension);
    height: var(--icon-dimension);
    transition: transform 1s ease-in-out;
  }

  img:hover {
    transform: rotate(360deg);
  }

  #title {
    text-decoration: none;
    color: inherit;
    font-size: 20px;
  }

  img,
  span {
    padding: 8px 12px;
  }
</style>
