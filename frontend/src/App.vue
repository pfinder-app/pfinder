<template>
  <div id="app">
    <ion-app>
      <div v-if="!isLoading">
        <template v-if="isLoggedIn">
          <app-menu></app-menu>
          <ion-vue-router main></ion-vue-router>
        </template>
        <template v-else>
          <register></register>
        </template>
      </div>
    </ion-app>
    <ion-menu-controller></ion-menu-controller>
  </div>
</template>

<script lang="ts">
  import {Component, Vue, Watch} from 'vue-property-decorator';
  import AppMenu from "@/components/AppMenu.vue";
  import axios from 'axios';
  import Storage from '@/services/Storage';
  import Register from "@/views/Register.vue";

  const storage = new Storage();

  @Component({
    components: {
      Register,
      AppMenu
    }
  })
  export default class App extends Vue {

    private isLoading: boolean = true;

    get isLoggedIn() {
      return this.$store.state.App.isLoggedIn;
    }

    public async mounted(): Promise<void> {
      this.isLoading = true;
      const token: string = await storage.get('pfinder_token');
      if (token) {
        axios.defaults.headers.common['Authorization'] = await storage.get('pfinder_token');
        axios.get('/api/me').then((response) => {
          this.$store.commit('SET_LOGGEDIN', true);
          this.$store.commit('SET_USER', response.data.data);
        })
      }
      this.isLoading = false;
    }
  }
</script>

<style>
</style>
