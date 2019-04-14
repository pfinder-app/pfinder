<template>
  <div id="app">
    <ion-app>
      <app-menu></app-menu>
      <ion-vue-router main></ion-vue-router>
    </ion-app>
    <ion-menu-controller></ion-menu-controller>
  </div>
</template>

<script lang="ts">
  import { Component, Vue } from 'vue-property-decorator';
  import AppMenu from "@/components/AppMenu.vue";
  import {IUser} from "@/interfaces/IUser";
  import axios from 'axios';

  @Component({
    components: {
      AppMenu
    }
  })
  export default class App extends Vue {
    mounted() {
      axios.get('/api/users/1').then((response) => {
        this.$store.commit('SET_USER', response.data.data)
      })
    }
  }
</script>

<style>
</style>
