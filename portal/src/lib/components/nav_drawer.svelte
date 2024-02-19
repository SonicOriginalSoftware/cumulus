<script>
    import Drawer from "./drawer.svelte"

  /** @type {{ nav_sections: import("$lib/types.js").NavSection[] }}*/
  const { nav_sections = [], children } = $props()
</script>

<Drawer>
<nav>
  <ul>
    {#each nav_sections as { section_name, routes }}
      <span>{section_name}</span>
      <hr style="width: 90vw; margin: 6px 0;" />
      {#each routes as { content, href, target, rel, class_list }}
        <li>
          <a {href} class={class_list} {target} {rel}>
            {#if typeof content === "string"}
              {content}
            {:else}
              <svelte:component this={content} />
            {/if}
          </a>
        </li>
      {/each}
      <br />
    {/each}
  </ul>
  {@render children()}
</nav>
</Drawer>

<style>
  nav {
    padding: 10px 0;
    font-size: 1.5rem;
  }

  nav a {
    display: block;
    padding: 6px 0;
    text-decoration: none;
  }

  ul {
    list-style-type: none;
    text-align: center;
  }
</style>
