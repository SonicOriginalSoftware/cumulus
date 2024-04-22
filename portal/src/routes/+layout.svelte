<script>
  import { page } from "$app/stores"

  import Background from "$lib/components/background.svelte"
  import NavigationDrawer from "$lib/components/nav_drawer.svelte"
  import Toggle from "$lib/components/toggle.svelte"
  import TopBar from "$lib/components/topbar.svelte"

  let { children } = $props()

  let drawer_toggle_id = "nav_drawer_toggle_id"
  let drawer_shown = $state(false)

  /** @type {import("$lib/types.js").NavSection[]} */
  const nav_sections = [
    {
      section_name: "",
      routes: [{ content: "Home", href: "/", class_list: "ripple" }],
    },
  ]
</script>

<svelte:head>
  <meta name="description" content={$page.data.description} />
  <title>{$page.data.title}</title>
</svelte:head>

<Background />

<TopBar {drawer_toggle_id} {drawer_shown} />
<Toggle bind:checked={drawer_shown} toggle_id={drawer_toggle_id} />

<div>
  <NavigationDrawer {nav_sections} {drawer_shown}></NavigationDrawer>
  <main>
    {@render children()}
  </main>
</div>

<style>
  @import "$lib/styles/global.css";
  @import "$lib/styles/colors.css";
  @import "$lib/styles/sizes.css";
  @import "$lib/styles/fonts.css";
  @import "$lib/styles/ui.css";
  @import "$lib/styles/effects.css";
  @import "$lib/styles/generic.css";

  div {
    position: relative;
    display: flex;
  }

  main {
    width: 100%;
    position: relative;
  }

  div {
    height: 100%;
  }
</style>
