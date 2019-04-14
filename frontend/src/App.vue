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

  @Component({
    components: {
      AppMenu
    }
  })
  export default class App extends Vue {
    mounted() {
      let user: IUser = {
        id: 1,
        name: 'Veronika',
        scoutname: 'Spatz',
        birthdate: '2000-01-02',
        canton: 'zh',
        scoutgroup: 'Pfadi Dunant'
      };
      this.$store.commit('SET_USER', user)
    }
  }
</script>

<style>
</style>
