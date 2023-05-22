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

export default defineComponent({
  name: "IndexPage",
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
            // console.log(res.data)
            Notify.create({
              type: "positive",
              message: "Login successfully.",
            });
            // this.storeLogUser.userid = res.data.id;
            // this.storeLogUser.fullname = res.data.fullname;
            // this.storeLogUser.accessToken = res.data.accessToken;
            this.$router.push("/");
          }
        })
        .catch((err) => {
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
