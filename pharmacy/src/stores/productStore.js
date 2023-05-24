import { defineStore } from "pinia";
import axios from "axios";

export const useProductStore = defineStore("productStore", {
  state: () => ({
    products: {},
    category: {},
  }),
  getters: {
    getProducts: (state) => state,
    loaded() {
      return this.products.length > 0;
    },
  },
  actions: {
    async fetchAll() {
      try {
        await axios.get("http://localhost:3000/api/all").then((res) => {
          res.data.map((item) => {
            this.products[item.Product_Id] = item;
          });
        });
      } catch (err) {
        console.log(err);
      }
    },
    async fetchCategory(category) {
      this.category = {};
      try {
        await axios.get("http://localhost:3000/api/" + category).then((res) => {
          res.data.record.map((item) => {
            this.category[item.Product_Id] = item;
          });
        });
      } catch (err) {
        console.log(err);
      }
    },
  },
});
