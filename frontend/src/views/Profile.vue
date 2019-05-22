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
      <h1>{{user.scoutname}}</h1>
      <!--<div>{{user.scoutgroup}}, {{user.canton}}</div>
      <div>{{user.birthdate}}</div>-->
      <div>{{user.email}}</div>

      <br>
      <br>
      <br>
      <div>
        <a @click="logout">Abmelden</a>
      </div>
    </ion-content>
  </div>
</template>

<script lang="ts">
  import { Component, Vue } from 'vue-property-decorator';
  import { IUser } from '@/interfaces/IUser'

  @Component({})
  export default class Profile extends Vue {

    public get user(): IUser|null {
        return this.$store.state.App.user;
    }

    mounted() {
    }

    logout() {
      localStorage.removeItem('pfinder_token');
      this.$store.commit('SET_LOGGEDIN', false);
    }

  }
</script>

<style scoped>
</style>

