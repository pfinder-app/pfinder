<template>
  <ion-menu side="start">
    <ion-header>
      <ion-toolbar>
        <ion-title>Pfinder</ion-title>
      </ion-toolbar>
    </ion-header>
    <ion-content>
      <ion-list>
        <router-link to="/">
          <ion-item @click="close()">
            <ion-icon name="home" slot="start"></ion-icon>
            <ion-label>
              Home
            </ion-label>
          </ion-item>
        </router-link>
        <router-link to="/about">
          <ion-item @click="close()">
            <ion-icon name="information-circle-outline" slot="start"></ion-icon>
            <ion-label>
              About
            </ion-label>
          </ion-item>
        </router-link>
      </ion-list>
    </ion-content>
  </ion-menu>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';

@Component
export default class AppMenu extends Vue {
  public close() {
    // this is kind of hacky, but i couldn't find a better way
    document.querySelector('ion-menu-controller').close('start');
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
