<template>
  <div class="profile">
    <div v-if="step1">
      <div class="line"></div>
      <div class="box">
        <div class="circles">
          <q-icon class="circle" name="check" />
          <q-icon class="circle" name="check" />
          <q-icon class="circle" name="check" />
          <q-icon class="circle" name="check" />
        </div>
        <div class="text">
          <p>ยืนยันคำสั่ง</p>
          <p>คำสั่งถูกต้อง</p>
          <p>จัดส่งสินค้า</p>
          <p>รับสินค้าเรียบร้อย</p>
        </div>
      </div>
    </div>
    <div v-else><h2>Your order has been successful</h2></div>
  </div>
  <div class="btn">
    <q-btn color="yellow" label="ยืนยัน" flat @click="onclick" />
  </div>
</template>

<script>
import { Notify } from "quasar";

export default {
  name: "ProfilePage",
  data() {
    return {
      step1: true,
    };
  },
  methods: {
    onclick() {
      Notify.create({
        message: "Order Successful",
        type: "positive",
        timeout: 1000,
      });
      this.step1 = !this.step1;
    },
  },
};
</script>

<style lang="scss" scoped>
.profile {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 80vh;
  .line {
    position: relative;
    width: 590px;
    height: 10px;
    background: #5c1aec;
  }
  .box {
    position: absolute;
    top: 310px;
    width: 600px;
    height: 200px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }
  .circles {
    display: flex;
    justify-content: space-between;
  }
  .circle {
    border-radius: 50%;
    height: 50px;
    width: 50px;
    background: #5c1aec;
    color: #fff;
    font-size: 2em;
    display: flex;
  }
  .text {
    width: 600px;
    display: flex;
    justify-content: space-between;
  }
  p {
    font-weight: bold;
  }
}
.btn {
  background: #ed9a2e;
  display: flex;
  justify-content: center;
  width: fit-content;
  margin: auto;
  > * {
    color: #fff !important;
  }
}
</style>
