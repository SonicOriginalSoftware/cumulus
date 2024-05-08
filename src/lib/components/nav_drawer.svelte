<script>
  import Copyright from "$lib/components/copyright.svelte"
  import AccountHeader from "./account_header.svelte"

  /** @type {{
   drawer_shown: boolean,
   nav_sections: import("$lib/types.js").NavSection[],
   user: import("@auth/sveltekit").User,
  }} */
  let { drawer_shown = $bindable(), nav_sections = [], user } = $props()

  /** @param {MouseEvent & { currentTarget: EventTarget & HTMLElement }} e */
  async function hide_drawer(e) {
    drawer_shown = false
  }
</script>

{#if drawer_shown}
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
{/if}

<style>
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
    text-align: center;
  }
</style>
