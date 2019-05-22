<template>
  <div class="ion-page">
    <ion-header>
      <ion-toolbar>
        <ion-buttons slot="start">
          <ion-menu-button menu="start"></ion-menu-button>
        </ion-buttons>
        <ion-title>Hello World</ion-title>
      </ion-toolbar>
    </ion-header>
    <ion-content class="ion-padding">
      <div style="text-align: center;">
        <h1>Wilkommen bei Pfinder</h1>
        <img alt="Pfinder Logo" src="../assets/logo.png" width="200">
        <br>
      </div>
    </ion-content>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';

@Component({})
export default class Home extends Vue {}
</script>

