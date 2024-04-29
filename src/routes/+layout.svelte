<script>
  import { page } from "$app/stores"

  import { nav_sections } from "$lib/navigation.js"

  import AppBar from "$lib/components/appbar.svelte"
  import Background from "$lib/components/background.svelte"
  import NavigationDrawer from "$lib/components/nav_drawer.svelte"

  let { children } = $props()
  let drawer_shown = $state(false)

  // $inspect($page.data.session?.user)
</script>

<svelte:head>
  <meta name="description" content={$page.data.description} />
  <title>{$page.data.title}</title>
</svelte:head>

<Background />

<div id="app-layout">
  <AppBar bind:drawer_shown />
  <div id="app-content">
    <NavigationDrawer {nav_sections} {drawer_shown} />
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

  @media only screen and (min-width: 640px) {
    #app-layout {
      flex-direction: column !important;
    }

    #app-content {
      border-top: solid 0.5px !important;
      border-bottom: none !important;
      box-shadow: 0px 8px 8px -8px inset !important;
    }
  }

  #app-layout {
    display: flex;
    flex-direction: column-reverse;
    flex: 1;
  }

  #app-content {
    position: relative;
    display: flex;
    height: 100%;
    border-top: none;
    border-bottom: solid 0.5px;
    box-shadow: 0px -8px 8px -8px inset;
  }

  main {
    width: 100%;
    position: relative;
  }
</style>
