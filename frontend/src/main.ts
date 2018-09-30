import Vue from 'vue';
import App from './App.vue';
import store from './store';
import './registerServiceWorker';

// Onsen UI CSS import
import 'onsenui/css/onsenui.css';
import 'onsenui/css/onsen-css-components.css';

// Onsen JS import
// TODO: research if onsen ui typehints are available
import VueOnsen from 'vue-onsenui';

Vue.use(VueOnsen);

Vue.config.productionTip = false;

new Vue({
  store,
  render: (h) => h(App),
}).$mount('#app');
