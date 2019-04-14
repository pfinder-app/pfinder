<template>
  <div class="ion-page">
    <ion-header>
      <ion-toolbar>
        <ion-buttons slot="start">
          <ion-menu-button menu="start"></ion-menu-button>
        </ion-buttons>
        <ion-title>Mein Profil</ion-title>
      </ion-toolbar>
    </ion-header>
    <ion-content class="ion-padding" v-if="user">
      <h1>{{user.name}}</h1>
      <div>{{user.scout_group}}</div>
    </ion-content>
  </div>
</template>

<script lang="ts">
  import { Component, Vue } from 'vue-property-decorator';
  import { IUser } from '@/interfaces/IUser'

  @Component({})
  export default class Profile extends Vue {

    user: IUser|null = null;

    mounted() {
      this.user = this.$store.state.App.user;
    }

  }
</script>

<style scoped>
</style>

