<template>
  <div id="app">
    <v-ons-navigator swipeable
      :page-stack="pageStack"
      @push-page="pageStack.push($event)"
      @replace-page="pageStack.pop(); pageStack.push($event)"
    ></v-ons-navigator>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import Home from '@/views/Home.vue';
import Login from '@/views/Login.vue';

@Component({})
export default class App extends Vue {

  // start page
  public pageStack = [Login];

}
</script>


<style lang="scss">
  a {
    text-decoration: underline;
  }
</style>
