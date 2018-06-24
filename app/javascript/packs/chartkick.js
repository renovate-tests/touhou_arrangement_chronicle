import Vue from 'vue/dist/vue.esm';
import axios from 'axios';
import VueChartkick from 'vue-chartkick';
//import Highcharts from 'highcharts';
//import Chart from 'chart.js';

Vue.use(VueChartkick);
//Vue.use(VueChartkick, {adapter: Highcharts});
//Vue.use(VueChartkick, {adapter: Chart});

new Vue({
  el: '#statistics',
  data () {
    return {
      object: document.getElementById("object").value,
      object_id: document.getElementById("object_id").value,
      original_code: '',
      count: [],
    }
  },
  mounted () {
    axios.get(`/api/v1/originals_count?object=${this.object}&object_id=${this.object_id}`)
      .then(res => {
        this.count = res.data;
      });
  },
  methods: {
    getOriginalSongsCount: function() {
      if (!this.original_code) {
        axios.get(`/api/v1/originals_count?object=${this.object}&object_id=${this.object_id}`)
          .then(res => {
            this.count = res.data;
          });
      } else {
        axios.get(`/api/v1/originals_count?object=${this.object}&object_id=${this.object_id}&original_code=${this.original_code}`)
          .then(res => {
            this.count = res.data;
          });
      }
    }
  }
});
