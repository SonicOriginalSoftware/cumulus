<script>
  let { toggle_id, checked = $bindable() } = $props()
</script>

<input bind:checked type="checkbox" id={toggle_id} />

<style>
  input {
    display: none;
  }
</style>
