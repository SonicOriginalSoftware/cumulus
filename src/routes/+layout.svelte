<script>
  import { onNavigate } from "$app/navigation"
  import { page } from "$app/stores"
  import { fly } from "svelte/transition"

  import AppBar from "$lib/components/appbar.svelte"
  import NavDrawer from "$lib/components/nav_drawer.svelte"
  import { nav_sections } from "$lib/navigation.js"

  let { children } = $props()

  /** @type {import("@auth/sveltekit").User}*/
  const user = $state($page.data.user)
  let drawer_shown = $state(false)

  onNavigate(() => {
    drawer_shown = false
  })
</script>

<svelte:head>
  <meta name="description" content={$page.data.description} />
  <title>{$page.data.title}</title>
</svelte:head>

<AppBar bind:drawer_shown {user}>
  {#if drawer_shown}
    <aside transition:fly={{ opacity: 1, x: "-100%", duration: 500 }}>
      <NavDrawer {drawer_shown} {nav_sections} {user} />
    </aside>
  {/if}
</AppBar>

<main>
  {@render children()}
</main>

<style>
  @import "$lib/styles/global.css";
  @import "$lib/styles/colors.css";
  @import "$lib/styles/sizes.css";
  @import "$lib/styles/fonts.css";
  @import "$lib/styles/ui.css";
  @import "$lib/styles/effects.css";
  @import "$lib/styles/generic.css";

  @media only screen and (min-width: 640px) {
    aside {
      width: auto !important;
      height: auto !important;
    }
  }

  aside {
    position: absolute;
    z-index: 100;
    display: flex;
    flex-direction: column;
    box-shadow: 8px 0px 8px -8px;
    background-color: var(--background);
    color: var(--foreground);
    width: 100%;
    overflow-y: auto;
  }

  main {
    position: relative;
    height: 100%;
    overflow-y: scroll;
    padding: 20px;
  }
</style>
