<template>
  <q-page class="flex flex-center" padding>
    <NavBar />
    {{ productsByCategory }}
    <div class="productCards" v-if="productStore.category">
      <ProductCard
        v-for="products in productStore.category"
        :key="products"
        :product="products"
      />
    </div>
  </q-page>
</template>

<script>
import { useRoute } from "vue-router";
import { useProductStore } from "../stores/productStore";
import ProductCard from "../components/ProductCard";
import NavBar from "../components/NavBar.vue";
import { useUserStore } from "src/stores/userStore";
export default {
  name: "ProductPage",
  components: { ProductCard, NavBar },
  setup() {
    const productStore = useProductStore();
    const userStore = useUserStore();
    const currentRouteName = useRoute().path.split("/")[1];
    return {
      productStore,
      userStore,
      currentRouteName,
    };
  },
  data() {
    return {
      products: null,
      productsByCategory: null,
      path: null,
    };
  },
  methods: {
    async getContent(category) {
      // Query the API and assign the response to "document"
      await this.productStore.fetchCategory(category);
    },
  },
  beforeRouteUpdate(to, from, next) {
    // Call the API query method when the URL changes
    this.getContent(to.params.category);
    next();
  },
  mounted() {
    if (!this.currentRouteName) {
      this.currentRouteName = "set";
      if (this.userStore.username) {
        this.$router.push("/set");
      }
    }
    this.productStore.fetchCategory(this.currentRouteName);
  },
};
</script>

<style>
.productCards {
  display: grid;
  width: 100vw;
  grid-template-columns: repeat(auto-fit, minmax(300px, auto));
  gap: 2rem;
  justify-items: center;
}
</style>
