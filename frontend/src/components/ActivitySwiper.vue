<template>

  <ion-slides>
    <ion-slide v-for="activity in activities">
      <ion-card>
        <div class="card-image"></div>
        <ion-card-header>
          <ion-card-subtitle>Aktivität</ion-card-subtitle>
          <ion-card-title>{{activity.title}}</ion-card-title>
        </ion-card-header>

        <ion-card-content>
          Diese Aktivität findet an folgendem Ort statt: <b>{{activity.place}}</b> und beginnt am <b>{{activity.begins_at}}</b>.
        </ion-card-content>
      </ion-card>
    </ion-slide>
  </ion-slides>
</template>

<script lang="ts">
  import {Component, Prop, Vue} from 'vue-property-decorator';

  @Component
  export default class ActivitySwiper extends Vue {
    @Prop({
      type: Array,
      required: true
    })
    public activities!: any[];
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .card-image {
    background: url(../assets/logo.png) #333;
    height: 100px;
    background-size: cover;
    background-position: 0 34%;
  }

</style>
