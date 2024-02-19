<script>
  const { expanded, children } = $props()
</script>

<aside>
  {@render children()}
</aside>

<style>
  aside {
    max-width: 25dvw;
  }
</style>
