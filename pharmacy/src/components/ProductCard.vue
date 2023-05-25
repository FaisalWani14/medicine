<template>
  <div class="card">
    <div class="img">
      <img :src="product.Product_Img" alt="" />
    </div>
    <div class="text">
      <span class="title">
        {{ product.Product_Name }}
        <p>{{ product.Product_Category }}</p>
      </span>
      <p>{{ product.Product_Description }}</p>
      <span class="bottom">
        <p>{{ product.Product_Price }} baht</p>
        <q-btn
          color="primary"
          icon="add"
          label="Add to Cart"
          @click="addToCart(product.Product_Id)"
        />
      </span>
    </div>
  </div>
</template>

<script>
import { useCartStore } from "../stores/cartStore";
export default {
  name: "ProductCard",
  props: { product: Object },
  setup() {
    const store = useCartStore();
    return {
      store,
    };
  },
  data() {
    return {};
  },
  methods: {
    addToCart(id) {
      console.log("Add tot cart", this.product);
      this.store.add(id);
    },
  },
};
</script>

<style scoped lang="scss">
* {
  margin: 0;
}
.card {
  border-radius: 20px;
  height: 300px;
  width: 300px;
  overflow: hidden;
  box-shadow: 1px 2px 10px 3px #666666;
}
.img {
  background: tan;
}
img {
  height: 150px;
  width: 100%;
  object-fit: contain;
}
.title {
  display: flex;
  justify-content: space-between;
  align-items: flex-end;
  gap: 1rem;
  font-size: 20px;
  p {
    font-size: 16px;
    color: #848484;
  }
}
.text {
  padding: 1rem;
}
.bottom {
  margin-top: 1rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 18px;
  font-weight: bold;
}
</style>
