<template>
    <v-ons-page>
        <v-ons-toolbar>
            <div class="center">Pfinder</div>
        </v-ons-toolbar>

        <v-ons-card>
            <div class="title">
                Wilkommen bei Pfinder
            </div>
            <div class="content">
                <ons-row style="margin-top: 10px">
                    <ons-col><v-ons-button modifier="large">Pfadis finden</v-ons-button></ons-col>
                </ons-row>
                <ons-row style="margin-top: 10px">
                    <ons-col width="50%">
                        <v-ons-button class="menu-button-half">Freunde</v-ons-button>
                    </ons-col>
                    <ons-col>
                        <v-ons-button class="menu-button-half">Wichtig</v-ons-button>
                    </ons-col>
                </ons-row>
                <ons-row style="margin-top: 10px">
                    <ons-col width="50%">
                        <v-ons-button class="menu-button-half">Treffpunkt</v-ons-button>
                    </ons-col>
                    <ons-col>
                        <v-ons-button class="menu-button-half">Hä?</v-ons-button>
                    </ons-col>
                </ons-row>
                <ons-row style="margin-top: 10px">
                    <ons-col>
                        <v-ons-button modifier="large">
                            <ons-icon icon="qrcode"></ons-icon> Connect</v-ons-button>
                    </ons-col>
                </ons-row>
            </div>
        </v-ons-card>
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

<style lang="scss">
    .menu-button-half {
        width: 98%;
    }
</style>
