import { defineStore } from "pinia";
import { useStorage } from "@vueuse/core";

export const useUserStore = defineStore("loginuser", {
  state: () => ({
    username: useStorage("username", ""),
    name: useStorage("name", ""),
    address: useStorage("address", ""),
    phone: useStorage("phone", ""),
  }),
  getters: {
    getUsername: (state) => {
      return state.username;
    },
  },
  actions: {
    clearStorage() {
      this.username = "";
      this.name = "";
      this.address = "";
      this.phone = "";
    },
  },
});
