import Vue from 'vue/dist/vue.esm';
import axios from 'axios';

new Vue({
  el: '#app',
  data () {
    return {
      category: 'symbol',
      category_i18n: '記号',
      detail_category: '',
      circles: {},
    }
  },
  mounted () {
    axios.get(`api/v1/circles?category=symbol`)
    .then(res => {
      this.circles = res.data;
    });
  },
  methods: {
    setCategory: function(category, category_i18n) {
      this.category = category;
      this.category_i18n = category_i18n;
      if (this.category == 'symbol' || this.category == 'number' || this.category == 'kanji') {
        this.detail_category = '';
        axios.get(`api/v1/circles?category=${category}`)
          .then(res => {
            this.circles = res.data;
          });
      } else if (this.category == 'alphabet') {
        this.detail_category = 'A';
        axios.get(`api/v1/circles?category=alphabet&detail_category=A`)
          .then(res => {
            this.circles = res.data;
          });
      } else if (this.category == 'kana') {
        this.detail_category = 'あ';
        axios.get(`api/v1/circles?category[]=hiragana&category[]=katakana&detail_category[]=あ&detail_category[]=い&detail_category[]=う&detail_category[]=え&detail_category[]=お`)
          .then(res => {
            this.circles = res.data;
          });
      } else {
        this.detail_category = '';
      }
    },
    setDetailCategory: function(detail_category) {
      this.detail_category = detail_category;
      if (this.category == 'alphabet') {
        axios.get(`api/v1/circles?category=${this.category}&detail_category=${this.detail_category}`)
          .then(res => {
            this.circles = res.data;
          });
      } else if (this.category == 'kana') {
        let params = "";
        switch(detail_category) {
          case 'あ':
            params = "detail_category[]=あ&detail_category[]=い&detail_category[]=う&detail_category[]=え&detail_category[]=お";
            break;
          case 'か':
            params = "detail_category[]=か&detail_category[]=き&detail_category[]=く&detail_category[]=け&detail_category[]=こ";
            break;
          case 'さ':
            params = "detail_category[]=さ&detail_category[]=し&detail_category[]=す&detail_category[]=せ&detail_category[]=そ";
            break;
          case 'た':
            params = "detail_category[]=た&detail_category[]=ち&detail_category[]=つ&detail_category[]=て&detail_category[]=と";
            break;
          case 'な':
            params = "detail_category[]=な&detail_category[]=に&detail_category[]=ぬ&detail_category[]=ね&detail_category[]=の";
            break;
          case 'は':
            params = "detail_category[]=は&detail_category[]=ひ&detail_category[]=ふ&detail_category[]=へ&detail_category[]=ほ";
            break;
          case 'ま':
            params = "detail_category[]=ま&detail_category[]=み&detail_category[]=む&detail_category[]=め&detail_category[]=も";
            break;
          case 'や':
            params = "detail_category[]=や&detail_category[]=ゆ&detail_category[]=よ";
            break;
          case 'ら':
            params = "detail_category[]=ら&detail_category[]=り&detail_category[]=る&detail_category[]=れ&detail_category[]=ろ";
            break;
          case 'わ':
            params = "detail_category[]=わ&detail_category[]=を&detail_category[]=ん";
            break;
        }
        axios.get(`api/v1/circles?category[]=hiragana&category[]=katakana&${params}`)
          .then(res => {
            this.circles = res.data;
          });
      }
    },
    isCategoryActive: function(category) {
      this.category == category;
    },
    isDetailCategoryActive: function(detail_category) {
      this.detail_category == detail_category;
    },
  },
  computed: {
    sortedArray() {
      return this.circles.sort((a, b) => a.name_ja > b.name_ja );
    },
  },
});
