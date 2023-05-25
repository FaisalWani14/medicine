import { defineStore } from "pinia";
import { useStorage } from "@vueuse/core";

export const useOrderStore = defineStore("orderStore", {
  state: () => ({
    orderID: useStorage("orderID", 20),
    billID: useStorage("billID", 20),
  }),
  actions: {
    getOrderID() {
      this.orderID++;
      return this.orderID;
    },
    getBillID() {
      this.billID++;
      return this.billID;
    },
    reset() {
      this.orderID = 20;
      this.billID = 20;
    },
  },
});
