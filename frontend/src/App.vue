<template>
  <div id="app">
    <ion-app>
      <template v-if="isLoggedIn">
        <app-menu></app-menu>
        <ion-vue-router main></ion-vue-router>
      </template>
      <template v-else>
        register
        <register></register>
      </template>
    </ion-app>
    <ion-menu-controller></ion-menu-controller>
  </div>
</template>

<script lang="ts">
  import { Component, Vue } from 'vue-property-decorator';
  import AppMenu from "@/components/AppMenu.vue";
  import {IUser} from "@/interfaces/IUser";
  import axios from 'axios';
  import Register from "@/views/Register.vue";

  @Component({
    components: {
      Register,
      AppMenu
    }
  })
  export default class App extends Vue {

    get isLoggedIn() {
      return this.$store.state.App.isLoggedIn;
    }

    mounted() {
      axios.get('/api/users/1').then((response) => {
        this.$store.commit('SET_USER', response.data.data)
      })
    }
  }
</script>

<style>
</style>
