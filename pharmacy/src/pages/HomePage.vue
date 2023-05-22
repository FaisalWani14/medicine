<template>
  <q-page class="flex flex-center" padding>
    <q-btn color="primary" icon="check" label="OK" @click="getProducts()" />
    <div class="data" v-if="products">
      products:
      {{ products.length }}
    </div>
  </q-page>
</template>

<script>
export default {
  name: "HomePage",
  data() {
    return {
      products: null,
    };
  },
  methods: {
    getProducts() {
      this.$api
        .get("/api/all")
        .then((res) => {
          this.products = res.data;
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>

<style></style>
