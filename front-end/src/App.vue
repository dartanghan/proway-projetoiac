
<template>
  <main>
    Bem vindo ao projeto Proway!
    <p>Backend disse: {{ serverResponse }}</p>
  </main>
</template>
<script>
export default {
  data() {
    return {
      serverResponse: null,
    };
  },
  async mounted() {
    try {
      const response = await fetch('http://localhost:8000');
      this.serverResponse = await response.text();
    } catch (error) {
      console.error('Error fetching data from server:', error);
      this.serverResponse = 'Failed to fetch data from server.';
    }
  },
};
</script>

<style scoped>
header {
  line-height: 1.5;
}


@media (min-width: 1024px) {
  header {
    display: flex;
    place-items: center;
    padding-right: calc(var(--section-gap) / 2);
  }

  header .wrapper {
    display: flex;
    place-items: flex-start;
    flex-wrap: wrap;
  }
}
</style>
