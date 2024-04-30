<script>
  /** @type {{ toggle_id: string, checked: boolean }} */
  let { toggle_id, checked = $bindable() } = $props()
</script>

<input bind:checked type="checkbox" id={toggle_id} />

<style>
  input {
    display: none;
  }
</style>
