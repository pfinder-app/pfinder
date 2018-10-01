<template>
  <v-ons-page>
    <v-ons-toolbar>
      <v-ons-back-button></v-ons-back-button>
      <div class="center">Pfinder Home</div>
    </v-ons-toolbar>
    <hello-world></hello-world>
  </v-ons-page>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import HelloWorld from '@/components/HelloWorld.vue'; // @ is an alias to /src

@Component({
  components: {
    HelloWorld,
  },
})
export default class About extends Vue {

}
</script>
