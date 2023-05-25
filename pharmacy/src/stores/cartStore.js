import { defineStore } from "pinia";
import { useProductStore } from "./productStore";
import { useStorage } from "@vueuse/core";

export const useCartStore = defineStore("cartStore", {
  state: () => ({
    cartItem: useStorage("cartItem", {}),
  }),
  getters: {
    count() {
      return Object.keys(this.cartItem).reduce((acc, id) => {
        return acc + this.cartItem[id].quantity;
      }, 0);
    },
    total() {
      const productStore = useProductStore();
      return Object.keys(this.cartItem).reduce((acc, id) => {
        return (
          acc +
          productStore.products[id].Product_Price * this.cartItem[id].quantity
        );
      }, 0);
    },
    formattedProducts() {
      const productStore = useProductStore();
      return Object.keys(this.cartItem).map((product_id) => {
        const purchase = this.cartItem[product_id];

        return {
          id: product_id,
          title: productStore.products[product_id].Product_Name,
          quantity: purchase.quantity,
          price: productStore.products[product_id].Product_Price,
          cost:
            purchase.quantity * productStore.products[product_id].Product_Price,
        };
      });
    },
  },
  actions: {
    add(id) {
      if (!this.cartItem) {
        this.cartItem[id] = { quantity: 1 };
        return;
      }
      if (this.cartItem[id]) {
        this.cartItem[id].quantity += 1;
      } else {
        this.cartItem[id] = { quantity: 1 };
      }
    },
    remove(id) {
      if (!this.cartItem[id]) {
        return;
      }

      this.cartItem[id].quantity -= 1;

      if (this.cartItem[id].quantity === 0) {
        delete this.cartItem[id];
      }
    },
    clearCart() {
      this.cartItem = {};
    },
  },
});
