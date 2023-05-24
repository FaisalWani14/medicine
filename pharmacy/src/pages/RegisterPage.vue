<template>
  <q-page class="flex flex-center" padding>
    <form @submit.prevent="register" class="form" ref="myRegisterForm">
      <div class="left">
        <q-input name="username" v-model="username" placeholder="Username" />
        <q-input
          name="password"
          v-model="password"
          placeholder="Password"
          type="password"
        />
        <q-input
          name="confirmPass"
          v-model="confirmPass"
          type="password"
          placeholder="Confirm Password"
        />
        <q-input
          name="address"
          v-model="address"
          type="text"
          placeholder="Address"
        />
      </div>
      <div class="right">
        <q-input name="name" v-model="name" placeholder="Name" />
        <q-input
          name="Email"
          v-model="email"
          placeholder="Email"
          type="email"
        />
        <q-input
          name="phone"
          v-model="phone"
          type="number"
          placeholder="Phone Number"
        />
        <q-btn label="register" type="submit" color="primary" />
      </div>
    </form>
  </q-page>
</template>

<script>
import { useUserStore } from "../stores/userStore";
export default {
  setup() {
    const userStore = useUserStore();
    return {
      userStore,
    };
  },
  data() {
    return {
      username: "",
      password: "",
      confirmPass: "",
      name: "",
      email: "",
      phone: "",
      address: "",
    };
  },
  methods: {
    register() {
      const data = {
        username: this.username,
        password: this.password,
        name: this.name,
        email: this.email,
        phone: this.phone,
        address: this.address,
      };
      this.$api
        .post("/auth/signup", data)
        .then((res) => {
          if (res.status == 200) {
            this.userStore.username = this.username;
            this.userStore.name =
              res.data.First_Name + " " + res.data.Last_Name;
            this.userStore.phone = res.data.Phone_Number;
            this.userStore.address = res.data.Staff_Address;
            this.$router.push("/set");
            this.$refs.myRegisterForm.reset();
          }
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>

<style scoped>
.form {
  display: flex;
  gap: 50px;
}
.left,
.right {
  display: flex;
  flex-direction: column;
  gap: 10px;
}
</style>
