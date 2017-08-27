
require('./bootstrap');

window.Vue = require('vue');

import Buefy from 'buefy'

Vue.use(Buefy);


Vue.component('link-add', require('./components/LinkAdd.vue'));
const app = new Vue({
    el: '#app'
});
