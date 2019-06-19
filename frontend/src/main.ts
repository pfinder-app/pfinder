import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import Ionic from '@ionic/vue';
import '@ionic/core/css/ionic.bundle.css';
import './css/theme.css'

Vue.use(Ionic);
Vue.config.productionTip = false;

// vue moment
const moment = require('moment');
require('moment/locale/de');
Vue.use(require('vue-moment'), { moment });
// vue moment typescript integration is not so great, but it works :/
// @ts-ignore
Vue.moment().locale('de');

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount('#app');
