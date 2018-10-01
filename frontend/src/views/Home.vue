<template>
  <v-ons-page>
    <v-ons-toolbar>
      <div class="center">Pfinder Home</div>
    </v-ons-toolbar>

    <v-ons-card>
      <div class="title">
        Awesome App
      </div>
      <div class="content">
        This is an example page<br><br>
        <v-ons-button @click="showAbout">
          Show About
        </v-ons-button>
      </div>
    </v-ons-card>
    <br>
    <br>
    <br>
    Eingeloggt als <b>{{$store.state.email}}</b>. <a @click="logout">Abmelden</a>
  </v-ons-page>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import HelloWorld from '@/components/HelloWorld.vue'; // @ is an alias to /src
import Login from '@/views/Login.vue';
import About from '@/views/About.vue';

@Component({})
export default class Home extends Vue {
  public logout() {
    this.$store.commit('setEmail', '');
    this.$emit('replace-page', Login);
  }
  public showAbout() {
    this.$emit('push-page', About);
  }
}
</script>
