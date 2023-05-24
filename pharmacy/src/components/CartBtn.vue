<template>
  <q-btn
    icon="shopping_cart"
    @click="this.$router.push('/cart')"
    :label="'ตะกร้า ' + store.count"
    flat
  />
</template>

<script>
import { useCartStore } from "../stores/cartStore";
export default {
  name: "CartBtn",
  setup() {
    const store = useCartStore();

    return {
      store,
    };
  },
  data() {
    return {};
  },
  methods: {},
};
</script>

<style lang="scss" scoped>
.cartBtn {
  padding: 1rem;
  height: 3rem;
  width: 3rem;
  font-size: 18px;
  /* background: #fff; */
  color: #000;
  text-decoration: none;
  margin-left: 1rem;
  > * {
    margin-right: 1rem;
  }
}
</style>
