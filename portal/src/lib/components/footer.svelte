<script>
  /** @type {{ children: import("svelte").Snippet }}*/
  const { children } = $props()
</script>

<footer>
  {@render children()}
</footer>

<style>
</style>
