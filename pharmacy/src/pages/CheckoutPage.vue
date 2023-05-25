<template>
  <div class="q-px-xl checkout">
    <h1 class="text-h4">ใบเสร็จ</h1>
    <div class="row text-left">
      <p class="col-6">{{ userStore.username }} {{ userStore.phone }}</p>
      <p class="col-3">Date: 2023-05-19</p>
      <p class="col-3">เวลา: 06:05:55</p>
    </div>
    <div class="q-pa-md table">
      <q-table
        flat
        bordered
        :rows="rows"
        :columns="columns"
        row-key="name"
        :hide-bottom="true"
      />
    </div>
    <p>จัดส่งที่ {{ userStore.address }}</p>
    <p>ค่าจัดส่ง 20</p>
    <h1 class="text-h5">รวมทั้งสิ้น: {{ cartStore.total }} บาท</h1>
    <h1 class="text-h5">ดำเนินการชำระเงิน</h1>
    <q-select v-model="payment" :options="options" label="Payment" filled />
    <q-btn
      class="q-my-md"
      color="positive"
      label="ยืนยัน"
      @click="this.$router.push('/profile')"
    />
  </div>
</template>

<script>
import { useUserStore } from "src/stores/userStore";
import { useCartStore } from "src/stores/cartStore";
import { useProductStore } from "src/stores/productStore";
const columns = [
  {
    name: "Bill_Number",
    label: "รหัสเมนู",
    field: "Bill_Number",
  },
  { name: "Product_Name", label: "รายการ", field: "Product_Name" },
  {
    name: "Product_Description",
    label: "รายละเอียด",
    field: "Product_Description",
  },
  { name: "Quantity", label: "จำนวน", field: "Quantity" },
  { name: "Unit_Price", label: "ราคา", field: "Unit_Price" },
  { name: "Total", label: "ยอดรวมสุทธิ", field: "Total" },
];

export default {
  name: "CheckoutPage",
  setup() {
    const userStore = useUserStore();
    const cartStore = useCartStore();
    const productStore = useProductStore();
    return {
      columns,
      userStore,
      cartStore,
      productStore,
    };
  },
  data() {
    return {
      rows: [],
      payment: "",
      options: ["Prompay", "Cash", "Credit Card", "Debit Card"],
    };
  },
  methods: {
    async getOrders() {
      Object.keys(this.cartStore.formattedProducts).forEach((i) => {
        const item = this.cartStore.formattedProducts[i];
        this.rows.push({
          Bill_Number: item.id,
          Product_Name: item.title,
          Product_Description:
            this.productStore.products[item.id].Product_Description,
          Quantity: item.quantity,
          Unit_Price: item.price,
          Total: item.cost,
        });
      });
    },
  },
  async mounted() {
    await this.getOrders();
  },
};
</script>

<style lang="scss">
.checkout {
  background: #fff;
  margin: 2rem;
  padding: 1rem 2rem;
}
.table {
  * {
    text-align: left;
  }
}
thead {
  background: #cef3fc;
  font-weight: bold;
}
</style>
