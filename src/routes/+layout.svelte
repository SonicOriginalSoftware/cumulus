<script>
  import { page } from "$app/stores"

  import { nav_sections } from "$lib/navigation.js"

  import AppBar from "$lib/components/appbar.svelte"
  import NavigationDrawer from "$lib/components/nav_drawer.svelte"

  let { children } = $props()
  let drawer_shown = $state(false)

  /** @type {import("@auth/sveltekit").User}*/
  const user = $state($page.data.user)
  $inspect(user)
</script>

<svelte:head>
  <meta name="description" content={$page.data.description} />
  <title>{$page.data.title}</title>
</svelte:head>

<!-- <Background /> -->

<div id="app-layout">
  <AppBar bind:drawer_shown />
  <div id="app-content">
    <NavigationDrawer {nav_sections} {drawer_shown} {user} />
    <main>
      {@render children()}
    </main>
  </div>
</div>

<style>
  @import "$lib/styles/global.css";
  @import "$lib/styles/colors.css";
  @import "$lib/styles/sizes.css";
  @import "$lib/styles/fonts.css";
  @import "$lib/styles/ui.css";
  @import "$lib/styles/effects.css";
  @import "$lib/styles/generic.css";

  #app-layout {
    display: flex;
    flex-direction: column;
    height: 100%;
    overflow: hidden;
  }

  #app-content {
    flex: 1;
    position: relative;
    height: 100%;
  }

  main {
    height: 100%;
    overflow-y: scroll;
  }
</style>
