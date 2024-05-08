<script>
  import { slide } from "svelte/transition"

  let show_dropdown = $state(false)

  /** @type {{ options: { id: string, label: string, disabled?: boolean }[] }} */
  let { options } = $props()

  /**
   * @param {HTMLInputElement} node
   * @param {number} index
   */
  function default_checked(node, index) {
    if (index === 0) node.setAttribute("checked", "true")
  }

  function selected() {
    show_dropdown = false
  }
</script>

<input hidden type="checkbox" id="dropdown-toggle" bind:checked={show_dropdown} />
<div id="select">
  <ul class="center-align-text">
    {#each options as { id, label, disabled }, index}
      <li transition:slide={{ delay: 2000 }}>
        <input
          hidden
          {disabled}
          {id}
          value={id}
          type="radio"
          name="select"
          onchange={selected}
          use:default_checked={index}
        />
        <label for={id} class={disabled ? "" : "ripple"}>{label}</label>
      </li>
    {/each}
  </ul>
  <label id="dropdown-toggle-label" for="dropdown-toggle" class="ripple material-symbols"
    >expand_more</label
  >
</div>

<style>
  #select {
    display: flex;
    align-items: flex-start;
    justify-content: center;
  }

  #dropdown-toggle-label {
    padding: 4px 10px;
  }

  ul {
    list-style-type: none;
  }
  ul > li {
    display: flex;
  }

  ul > li > label {
    display: none;
    justify-content: flex-end;
    width: 100%;
    padding: 4px 10px;
  }

  #dropdown-toggle ~ #select > label.material-symbols {
    transition: transform 0.5s linear;
  }
  #dropdown-toggle:checked ~ #select > label.material-symbols {
    transform: rotateX(180deg);
  }
  #dropdown-toggle:checked ~ #select > ul > li > label {
    display: flex;
  }
  #dropdown-toggle:checked ~ #select > ul > li > input:checked:enabled ~ label {
    background-color: var(--ui-secondary);
  }

  li > input:checked ~ label {
    display: block;
    pointer-events: none;
  }

  li > input:disabled ~ label {
    opacity: 0.6;
  }
</style>
