<template>
  <div class="nav">
    <router-link to="/set">Medicine Set</router-link>
    <router-link to="/promotion">Promotion</router-link>
    <router-link to="/medicine">Medicine</router-link>
    <router-link to="/other">Other</router-link>
  </div>
</template>

<script>
export default {
  name: "NavBar",
};
</script>

<style scoped lang="scss">
.nav {
  width: 100%;
  height: 80px;
  display: flex;
  justify-content: space-evenly;
  margin-bottom: 2rem;
  background: #1d1547;

  * {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    text-decoration: none;
    font-size: 20px;
    border: 1px solid white;
    color: white;
  }
}
</style>
