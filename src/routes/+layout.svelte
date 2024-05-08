<script>
  import { page } from "$app/stores"

  import AppBar from "$lib/components/appbar.svelte"
  import NavigationDrawer from "$lib/components/nav_drawer.svelte"

  import { nav_sections } from "$lib/navigation.js"
  import { fly } from "svelte/transition"

  let { children } = $props()
  let drawer_shown = $state(false)

  /** @type {import("@auth/sveltekit").User}*/
  const user = $state($page.data.user)
</script>

<svelte:head>
  <meta name="description" content={$page.data.description} />
  <title>{$page.data.title}</title>
</svelte:head>

<AppBar bind:drawer_shown />

{#if drawer_shown}
  <aside transition:fly={{ opacity: 1, x: "-100%", duration: 500 }}>
    <!-- <button onclick={hide_drawer}></button> -->
    <NavigationDrawer bind:drawer_shown {nav_sections} {user} />
  </aside>
{/if}

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
    }
  }

  aside {
    position: absolute;
    z-index: 100;
    box-shadow: 8px 0px 8px -8px;
    background-color: var(--background);
    color: var(--foreground);
  }

  button {
    appearance: none;
    border: none;
    z-index: 90;
    /* width: 100%; */
    /* height: 100%; */
    background-color: red;
    opacity: 0;
  }

  main {
    position: relative;
    height: 100%;
    overflow-y: scroll;
    padding: 20px;
  }
</style>
