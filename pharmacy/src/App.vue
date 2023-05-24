<template>
  <router-view />
</template>

<script>
import { defineComponent } from "vue";
import { useProductStore } from "./stores//productStore";
export default defineComponent({
  name: "App",
  setup() {
    const productStore = useProductStore();
    return {
      productStore,
    };
  },
  mounted() {
    this.productStore.fetchAll();
  },
});
</script>
