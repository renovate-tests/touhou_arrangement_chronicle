import Vue from 'vue/dist/vue.esm';
import { ClientTable } from 'vue-tables-2';
Vue.use(ClientTable, {}, false, 'bulma');

new Vue({
  el: '#songs',
  data () {
    return {
      columns: [
        'circle',
        'title_ja',
        'discography',
        'vocalists',
        'arrangers',
        'lyricists',
        'original_songs',
      ],
      options: {
        perPage: 25,
        perPageValues: [10,25,50,100,300],
        columnsDropdown: true,
        filterByColumn: true,
        texts: {
          count:"全{count}曲中 {from}〜{to} 曲を表示|{count} 曲|1 曲",
          filterPlaceholder: '検索する',
          columns: '表示/非表示 カラム',
          filterBy:"{column} を検索",
          limit: "表示件数：",
        },
        headings: {
          circle: 'サークル名',
          title_ja: '曲名',
          discography: 'ディスコグラフィ',
          vocalists: 'ボーカリスト',
          arrangers: '編曲者',
          lyricists: '作詞者',
          original_songs: '原曲',
        },
        sortIcon: {
          base:'mdi',
          up:'mdi-menu-up',
          down:'mdi-menu-down',
          is:'mdi-sort',
        }
      },
      sortable: [
        'circle',
        'title_ja',
        'discography',
        'vocalists',
        'arrangers',
        'lyricists',
        'original_songs',
      ],
    }
  },
});
