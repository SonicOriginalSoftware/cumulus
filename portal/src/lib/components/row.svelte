<script>
  let { children } = $props()
</script>

<div>
  {@render children()}
</div>

<style>
  div {
    display: flex;
  }
</style>
