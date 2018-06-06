import Vue from 'vue/dist/vue.esm';
import Datepicker from 'vuejs-datepicker';
import { ja } from 'vuejs-datepicker/dist/locale';

new Vue({
  el: '#app',
  components: {
    Datepicker
  },
  data: {
    language: ja,
    series_title: '',
    title: '',
  }
});
