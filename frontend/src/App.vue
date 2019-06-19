<template>
  <div id="app">
    <ion-app>
      <template v-if="isLoggedIn">
        <app-menu></app-menu>
        <ion-vue-router main></ion-vue-router>
      </template>
      <template v-else>
        register
        <register></register>
      </template>
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

    get isLoggedIn() {
      return this.$store.state.App.isLoggedIn;
    }

    mounted(): void {
      let token = localStorage.getItem('pfinder_token');
      if (token) {
        this.$store.commit('SET_LOGGEDIN', true);
      }
    }

    @Watch('isLoggedIn')
    public watchIsLoggedIn() {
      if (this.isLoggedIn) {
        axios.defaults.headers.common['Authorization'] = localStorage.getItem('pfinder_token');
        axios.get('/api/me').then((response) => {
          this.$store.commit('SET_USER', response.data.data)
        })
      }
    }
  }
</script>

<style>
</style>
