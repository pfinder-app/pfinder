<template>
  <div class="ion-page">
    <ion-content class="ion-padding">
      <div style="text-align: center;">
        <h1>Wilkommen bei Pfinder</h1>
        <img alt="Pfinder Logo" src="../assets/logo.png" width="100">
        <div>
          <input type="text" v-model="scoutname" placeholder="Pfadiname" class="register-input">
        </div>
        <div>
          <input type="email" v-model="email" placeholder="E-Mail" class="register-input">
        </div>
        <div>
          <ion-button @click="register()" shape="round" size="large" :disabled="!isValid">Mitmachen</ion-button>
        </div>
      </div>
    </ion-content>
  </div>
</template>

<script lang="ts">
  import { Component, Vue } from 'vue-property-decorator';
  import axios from 'axios';
  import Storage from '@/services/Storage';

  const storage = new Storage();

  @Component({})
  export default class Register extends Vue {

    private scoutname: string = '';
    private email: string = '';

    get isValid() {
      return (this.scoutname.length > 0 && this.isEmailValid);
    }

    get isEmailValid(): boolean {
        let re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(String(this.email).toLowerCase());
    }

    public async register(): Promise<void> {
      if (this.isValid) {
        const data = {
          scoutname: this.scoutname,
          email: this.email,
        };
        const response = await axios.post('/api/me', { data: data });
        if (response.status === 200 && response.data.data.token) {
          const token = response.data.data.token;
          await storage.set('pfinder_token', token);
          this.$store.commit('SET_LOGGEDIN', true);
        }
      }
    }

  }
</script>

<style scoped>
  .register-input {
    padding: 10px;
    border-radius: 20px;
    border: 1px solid #7f4b19;
    margin-bottom: 10px;
    width: 80%;
  }
</style>

