<template>
  <q-page padding class="page">
    <div class="detail">
      <h1>user detail</h1>
      <div>
        <p>Full Name: {{ userStore.name }}</p>
        <p>Full Name: {{ userStore.address }}</p>
        <p>Full Name: {{ userStore.phone }}</p>
      </div>

      <h1>Transfer</h1>
      <div>
        <input type="radio" name="transfer" id="delivery" />
        <label for="">Delivery</label>
      </div>
      <div>
        <input type="radio" name="transfer" id="pickup" />
        <label for="">Pick up</label>
      </div>
    </div>
    <div class="cartItems" v-if="cartStore.count">
      <h1>รายการสั่งซื้อ</h1>
      <CartCard
        v-for="item in cartStore.formattedProducts"
        :key="item"
        :product="item"
      />
      <h3>Total: {{ cartStore.total }}</h3>
      <q-btn
        color="primary"
        icon="shopping_cart_checkout"
        label="checkout"
        to="/checkout"
      />
    </div>
    <h1 v-else>Cart is empty</h1>
  </q-page>
</template>

<script>
import CartCard from "../components/CartCard.vue";
import { useCartStore } from "../stores/cartStore";
import { useProductStore } from "../stores/productStore";
import { useUserStore } from "../stores/userStore";

export default {
  name: "CartPage",
  components: { CartCard },
  setup() {
    const cartStore = useCartStore();
    const productStore = useProductStore();
    const userStore = useUserStore();
    return {
      cartStore,
      productStore,
      userStore,
    };
  },
};
</script>

<style lang="scss" scoped>
.page {
  display: flex;
  > * {
    padding: 1rem 2rem;
    h1 {
      font-size: 25px;
      font-weight: bold;
      line-height: 2rem;
    }
  }
}
.detail {
  width: 50vw;
  height: 70vh;
  margin: 2rem;
  background: #fff;
  border-radius: 20px;
  box-shadow: 1px 1px 10px 2px #ccc;
}
.cartItems {
  background: #fff;
  width: 50vw;
  padding: 2rem;
}
.transfer {
  border: 1px solid #000;
}
label {
  margin-left: 1rem;
}
</style>
