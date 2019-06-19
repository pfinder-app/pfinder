<template>
  <div class="ion-page">
    <ion-header>
      <ion-toolbar>
        <ion-buttons slot="start">
          <ion-menu-button menu="start"></ion-menu-button>
        </ion-buttons>
        <ion-title>Willkommen</ion-title>
      </ion-toolbar>
    </ion-header>
    <ion-content class="ion-padding">
      <activity-swiper :activities="activities" v-if="activities.length > 0"></activity-swiper>
    </ion-content>
  </div>
</template>

<script lang="ts">
  import {Component, Vue, Watch} from 'vue-property-decorator';
import axios from 'axios';
import ActivitySwiper from "@/components/ActivitySwiper.vue";

@Component({
  components: {ActivitySwiper}
})
export default class Home extends Vue {
  private activities = [];

  get isLoggedIn() {
    return this.$store.state.App.isLoggedIn;
  }

  @Watch('isLoggedIn', { immediate: true })
  public watchIsLoggedIn() {
    if (this.isLoggedIn) {
      axios.get('/api/activities').then((response) => {
        this.activities = response.data.data;
      })
    }
  }

}
</script>

