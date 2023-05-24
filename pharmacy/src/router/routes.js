const routes = [
  {
    path: "/",
    component: () => import("layouts/MainLayout.vue"),
    children: [
      {
        path: "/",
        component: () => import("pages/ProductPage.vue"),
        meta: { requiresAuth: true },
      },
      {
        path: "/login",
        component: () => import("pages/LoginPage.vue"),
        meta: { requiresAuth: false },
      },
      {
        path: "/register",
        component: () => import("pages/RegisterPage.vue"),
        meta: { requiresAuth: false },
      },
      {
        path: "/cart",
        component: () => import("pages/CartPage.vue"),
        meta: { requiresAuth: true },
      },
      {
        path: "/:category",
        component: () => import("pages/ProductPage.vue"),
        meta: { requiresAuth: true },
      },
      {
        path: "/checkout",
        component: () => import("pages/CheckoutPage.vue"),
        meta: { requiresAuth: true },
      },
      {
        path: "/profile",
        component: () => import("pages/ProfilePage.vue"),
        meta: { requiresAuth: true },
      },
      {
        path: "/table/:name",
        component: () => import("pages/TablePage.vue"),
        meta: { requiresAuth: true },
      },
    ],
  },

  // Always leave this as last one,
  // but you can also remove it
  {
    path: "/:catchAll(.*)*",
    component: () => import("pages/ErrorNotFound.vue"),
  },
];

export default routes;
