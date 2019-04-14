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

  @Component({
    components: {
      AppMenu
    }
  })
  export default class App extends Vue {
    mounted() {
      let user = {
        id: 1,
        name: 'Spatz',
        email: 'spatz@example.com',
        scout_group: 'Pfadi Dunant'
      };
      this.$store.commit('SET_USER', user)
    }
  }
</script>

<style>
</style>
