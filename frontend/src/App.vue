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
  export default class App extends Vue {}
</script>

<style>
</style>
