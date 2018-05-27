import Vue from 'vue/dist/vue.esm';

new Vue({
  el: '#app',
  data: {
    menu: 'event_series',
  },
  methods: {
    setMenu: function(menu) {
      this.menu = menu;
    },
    isActive: function(menu) {
      this.menu == menu;
    }
  }
});
