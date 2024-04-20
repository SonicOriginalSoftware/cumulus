<script>
  import { slide } from "svelte/transition"

  /** @type {{ nav_sections: import("$lib/types.js").NavSection[], children: import("svelte").Snippet }}*/
  const { drawer_shown, nav_sections = [], children } = $props()
</script>

{#if drawer_shown}
  <aside transition:slide={{ axis: "x", duration: 2000 }}>
    <nav>
      <ul>
        {#each nav_sections as { section_name, routes }}
          <span>{section_name}</span>
          <hr />
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
    </nav>
    {@render children()}
  </aside>
{/if}

<style>
  aside {
    box-shadow: 10px 10px;
    /* width: 25vw; */
    /* padding: 10px 0; */
  }

  nav {
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
