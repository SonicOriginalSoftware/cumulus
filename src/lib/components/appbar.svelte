<script>
  import { page } from "$app/stores"

  import Toggle from "$lib/components/toggle.svelte"

  /** @type {{drawer_shown: boolean}}*/
  let { drawer_shown = $bindable() } = $props()
  const drawer_toggle_id = "nav_drawer_toggle_id"
</script>

<Toggle bind:checked={drawer_shown} toggle_id={drawer_toggle_id} />
<header>
  <label for={drawer_toggle_id} class="press ripple material-symbols">
    {#if drawer_shown}
      close
    {:else}
      menu
    {/if}
  </label>
  <span class="inactive" id="title">{$page.data.section}</span>
  <img src="/res/icons/logo.svg" alt="logo" class="icon-size" />
</header>

<style>
  header {
    z-index: 100;
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: var(--background);
    border-radius: 4px;
    box-shadow: 0px -1px 6px 1px;
  }

  label {
    font-size: var(--icon-dimension);
    padding: 8px;
  }

  img {
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
