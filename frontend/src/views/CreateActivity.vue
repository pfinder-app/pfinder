<template>
  <div class="ion-page">
    <ion-header>
      <ion-toolbar>
        <ion-buttons slot="start">
          <ion-menu-button menu="start"></ion-menu-button>
        </ion-buttons>
        <ion-title>Neue Aktivität</ion-title>
      </ion-toolbar>
    </ion-header>
    <ion-content>
      <ion-item>
        <ion-label position="floating">Was möchtest du machen?</ion-label>
        <ion-input
                :value="data.title"
                @ionChange="data.title = $event.target.value"
        ></ion-input>
      </ion-item>
      <ion-item>
        <ion-label position="floating">Wann soll es stattfinden?</ion-label>
        <ion-datetime
                pickerFormat="MMMM YYYY"
                displayFormat="D. MMM HH:mm"
                value="2012-12-15T13:47:20.789"
                minuteValues="0,15,30,45"
                @ionChange="data.begins_at = $event.target.value"
        ></ion-datetime>
      </ion-item>
      <ion-item>
        <ion-label position="floating">Wo?</ion-label>
        <ion-input
                :value="data.place"
                @ionChange="data.place = $event.target.value"
        ></ion-input>
      </ion-item>

      <br>
      <ion-button expand="block" @click="addActivity()">Aktivität erfassen</ion-button>
      <br>

      {{data}}
    </ion-content>
  </div>
</template>

<script lang="ts">
  import { Component, Vue } from 'vue-property-decorator';
  import { IUser } from '@/interfaces/IUser'
  import axios from 'axios';

  @Component({})
  export default class Profile extends Vue {

    public get user(): IUser|null {
        return this.$store.state.App.user;
    }

    private data = {};

    mounted() {
      this.data = {
        title: 'Tiju',
        place: 'Winterthur',
        begins_at: null
      }
    }

    public addActivity() {
      axios.post('/api/activities', {data: this.data}).then(() => {
        
      }).catch(() => {

      })
    }

  }
</script>

<style scoped>
</style>

