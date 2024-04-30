<script>
  import { fly } from "svelte/transition"

  import Copyright from "$lib/components/copyright.svelte"
  import AccountHeader from "./account_header.svelte"

  /** @type {{drawer_shown: boolean, nav_sections: import("$lib/types.js").NavSection[], user: import("@auth/sveltekit").User}}*/
  const { drawer_shown, nav_sections = [], user } = $props()
</script>

{#if drawer_shown}
  <aside transition:fly={{ opacity: 1, x: "-100%", duration: 500 }}>
    <AccountHeader {user} />
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
    <footer>
      <Copyright />
    </footer>
  </aside>
{/if}

<style>
  aside {
    z-index: 100;
    background-color: var(--background);
    color: var(--foreground);
    display: flex;
    flex-direction: column;
    position: absolute;
    left: 0;
    bottom: 0;
    height: 100%;
    box-shadow: 8px 0px 8px -8px;
  }

  nav {
    padding: 5% 0;
    font-size: 1.5rem;
    flex: 1;
  }

  nav a {
    display: block;
    padding: 8px 0;
    text-decoration: none;
  }

  ul {
    list-style-type: none;
    text-align: center;
  }

  footer {
    padding: 10% 40px 10% 40px;
    pointer-events: none;
  }
</style>
