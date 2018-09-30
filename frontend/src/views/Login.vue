<template>
  <v-ons-page>
    <v-ons-toolbar>
      <div class="center">
        Pfinder Login
        <ons-icon icon="fa-heart"></ons-icon>
      </div>
    </v-ons-toolbar>

    <v-ons-list>
      <v-ons-list-item>
        <div class="center">
          <v-ons-input placeholder="E-Mail" float v-model="email"></v-ons-input>
        </div>
      </v-ons-list-item>
      <v-ons-list-item>
        <v-ons-button modifier="large" @click="login" :disabled="email.length === 0">
          Login
        </v-ons-button>
      </v-ons-list-item>
    </v-ons-list>
  </v-ons-page>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import Home from '@/views/Home.vue';

@Component({})
export default class Login extends Vue {

  public email: string = '';

  public login() {
    this.$store.commit('setEmail', this.email);
    this.$emit('replace-page', Home);
  }
}
</script>