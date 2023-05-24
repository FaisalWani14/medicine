<template>
  <q-page class="flex flex-center">
    <q-form
      @submit="onSubmit"
      @reset="onReset"
      class="q-gutter-md"
      ref="myLoginForm"
    >
      <q-input v-model="username" type="username" label="Username" />
      <q-input v-model="password" type="password" label="Password" />

      <div>
        <q-btn label="Submit" type="submit" color="primary" />
        <q-btn
          label="Reset"
          type="reset"
          color="primary"
          flat
          class="q-ml-sm"
        />
      </div>
    </q-form>
    <a href="/register">Register</a>
  </q-page>
</template>

<script>
import { Notify } from "quasar";
import { defineComponent } from "vue";
import { useUserStore } from "../stores/userStore";

export default defineComponent({
  name: "LoginPage",
  setup() {
    const store = useUserStore();
    return {
      store,
    };
  },
  data() {
    return {
      username: "",
      password: "",
    };
  },
  methods: {
    onReset() {
      this.username = null;
      this.password = null;
    },
    onSubmit(e) {
      e.preventDefault();

      const data = {
        username: this.username,
        password: this.password,
      };

      this.$api
        .post("/auth/login", data)
        .then((res) => {
          if (res.status == 200) {
            Notify.create({
              type: "positive",
              message: "Login successfully.",
            });
            this.store.username = res.data.Username;
            this.store.name = res.data.First_Name + " " + res.data.Last_Name;
            this.store.phone = res.data.Phone_Number;
            this.store.address = res.data.Staff_Address;

            this.$router.push("/set");
          }
        })
        .catch((err) => {
          console.log(err);
          Notify.create({
            type: "negative",
            message: "Invalid Username or Password.",
          });
        });

      this.$refs.myLoginForm.reset();
    },
  },
});
</script>
