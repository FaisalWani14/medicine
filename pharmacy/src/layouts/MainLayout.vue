<template>
  <q-layout view="lHh Lpr lFf" class="layout">
    <q-header elevated class="bg-white text-black header">
      <q-toolbar>
        <q-toolbar-title class="text-black"> Pharmacy App </q-toolbar-title>
        <div v-if="userStore.getUsername" class="cart">
          <CartBtn />
          <div>
            <q-btn
              icon="o_account_circle"
              @click="this.$router.push('/profile')"
              :label="userStore.getUsername"
              flat
            >
            </q-btn>
            <q-btn flat icon="logout" @click="logout" />
          </div>
        </div>
      </q-toolbar>
    </q-header>

    <q-drawer v-model="leftDrawerOpen" show-if-above bordered>
      <q-item-label header> Essential Links </q-item-label>
      <q-list v-if="userStore.getUsername">
        <div v-for="link in linksList" :key="link.title">
          <EssentialLink
            v-if="link.needLogin"
            :key="link.title"
            v-bind="link"
          />
        </div>
        <q-item-label header class="q-mt-md"> Table Links </q-item-label>
        <EssentialLink
          v-for="link in tableList"
          :key="link.title"
          v-bind="link"
        />
      </q-list>
      <q-list v-else>
        <div v-for="link in essentialLinks" :key="link.title">
          <EssentialLink
            v-if="!link.needLogin"
            :key="link.title"
            v-bind="link"
          />
        </div>
      </q-list>
    </q-drawer>

    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script>
import { defineComponent, ref } from "vue";
import EssentialLink from "components/EssentialLink.vue";
import { Notify } from "quasar";
const linksList = [
  {
    title: "Products",
    caption: "Products Page",
    icon: "school",
    link: "/set",
    needLogin: true,
  },
  {
    title: "Login",
    caption: "Login Page",
    icon: "school",
    link: "/login",
    needLogin: false,
  },
  {
    title: "Register",
    caption: "Register Page",
    icon: "school",
    link: "/register",
    needLogin: false,
  },

  {
    title: "Cart",
    caption: "Cart Page",
    icon: "school",
    link: "/cart",
    needLogin: true,
  },
];
const tableList = [
  {
    title: "Customers",
    link: "/table/customer",
  },
  {
    title: "Orders",
    link: "/table/orders",
  },
  {
    title: "Order Details",
    link: "/table/order_details",
  },
  {
    title: "Payment",
    link: "/table/payment",
  },
  {
    title: "Product",
    link: "/table/product",
  },
  {
    title: "Staff",
    link: "/table/staff",
  },
  {
    title: "Supplier",
    link: "/table/supplier",
  },
];
import { useUserStore } from "../stores/userStore";
import CartBtn from "../components/CartBtn.vue";
export default defineComponent({
  name: "MainLayout",

  components: {
    EssentialLink,
    CartBtn,
  },

  setup() {
    const leftDrawerOpen = ref(false);
    const userStore = useUserStore();

    return {
      linksList,
      tableList,
      leftDrawerOpen,
      userStore,
      toggleLeftDrawer() {
        leftDrawerOpen.value = !leftDrawerOpen.value;
      },
    };
  },
  methods: {
    logout() {
      this.userStore.clearStorage();
      Notify.create({
        type: "info",
        message: "Logout successfully.",
      });
      this.$router.push("/login");
    },
  },
  beforeCreate() {
    const path = this.$router.currentRoute.value;
    const isLoggedIn = this.userStore.username.length > 0;
    if (!isLoggedIn) {
      if (path.path != "/register" && path.path != "/login") {
        console.log("object");
        this.$router.push("/login");
      }
    } else {
      if (path.path == "/register" || path.path == "/login") {
        this.$router.push("/set");
      }
    }
  },
});
</script>

<style lang="scss">
.q-layout-padding {
  padding: 0px;
  background: #fceed3;
}
.cart {
  display: flex;
  align-items: center;
  > :nth-child(1) {
    width: fit-content;
    margin-right: 2rem;
  }
}
</style>
