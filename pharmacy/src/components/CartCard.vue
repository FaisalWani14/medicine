<template>
  <div class="card">
    <div class="img">
      <img
        src="https://www.imodium.com.au/sites/imodium_au/files/imodium-advanced-product-image.png"
        alt=""
      />
    </div>
    <div class="text">
      <p class="title">{{ product.title }}</p>
      <p class="quantity">{{ product.quantity }} x {{ product.price }}</p>
      <p class="price">{{ product.cost }} baht</p>
      <q-btn color="primary" icon="add" @click="cartStore.add(product.id)" />
      <q-btn
        color="primary"
        icon="remove"
        @click="cartStore.remove(product.id)"
      />
    </div>
  </div>
</template>

<script>
import { useCartStore } from "../stores/cartStore";
export default {
  name: "CartCard",
  props: { product: Object },
  setup() {
    const cartStore = useCartStore();
    return {
      cartStore,
    };
  },
  data() {
    return {};
  },
  methods: {
    addToCart(id) {
      this.cartStore.add(id);
    },
  },
};
</script>

<style scoped lang="scss">
* {
  margin: 0;
}
.card {
  border: 1px solid #000;
  border-radius: 20px;
  height: 150px;
  overflow: hidden;
  display: flex;
  margin-bottom: 2rem;
}
.img {
  background: tan;
}
img {
  height: 150px;
  width: 100%;
  object-fit: contain;
}
.text {
  padding: 1rem;
  .title {
  }
}
</style>
