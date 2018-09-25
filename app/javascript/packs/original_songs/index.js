import Vue from 'vue/dist/vue.esm';

new Vue({
  el: '#app',
  data: {
    type: 'windows',
  },
  methods: {
    setOriginalType: function(type) {
      this.type = type;
    },
    isActive: function(type) {
      this.type == type;
    }
  }
});
