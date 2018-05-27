import Vue from 'vue/dist/vue.esm';

new Vue({
  el: '#app',
  data: {
    category: 'symbol',
    detail_category: '',
  },
  methods: {
    setCategory: function(category) {
      this.category = category;
      if (this.category == 'alphabet') {
        this.detail_category = 'A';
      } else if (this.category == 'kana') {
        this.detail_category = 'あ';
      } else {
        this.detail_category = '';
      }
    },
    setDetailCategory: function(detail_category) {
      this.detail_category = detail_category;
    },
    isCategoryActive: function(category) {
      this.category == category;
    },
    isDetailCategoryActive: function(detail_category) {
      this.detail_category == detail_category;
    }
  }
});
