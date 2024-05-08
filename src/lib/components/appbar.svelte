<script>
  import { page } from "$app/stores"

  /** @type {{drawer_shown: boolean, children?: any}}*/
  let { children, drawer_shown = $bindable() } = $props()

  const nav_drawer_toggle_label = "nav_drawer_toggle_label"
</script>

<header>
  <button
    id={nav_drawer_toggle_label}
    class="ripple material-symbols"
    onclick={() => (drawer_shown = !drawer_shown)}
  >
    {#if drawer_shown}
      close
    {:else}
      menu
    {/if}
  </button>
  <span class="inactive" id="title">{$page.data.section}</span>
  <img src="/res/icons/logo.svg" alt="logo" class="icon-size" />
</header>
{#if children}
  {@render children()}
{/if}

<style>
  header {
    z-index: 100;
    display: flex;
    overflow: hidden;
    justify-content: space-between;
    align-items: center;
    background-color: var(--background);
    border-radius: 4px;
    box-shadow: 0px -1px 6px 1px;
  }

  button {
    appearance: none;
    border: none;
    background-color: inherit;
    font-size: var(--icon-dimension);
    padding: 8px;
    cursor: default;
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
