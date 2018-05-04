class Category
  include ActiveModel::Model

  KIND = %w[symbol number hiragana katakana kanji alphabet].freeze
  KANA_LIST = 'あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをん'.split('')
  ALPHABET_LIST = ('A'..'Z').to_a
  LIST = KANA_LIST + ALPHABET_LIST

  class << self
    def select_category(name)
      detail_category = ''
      if name.match?(%r{^[!-\/:-@\[-`\{\}-~]})
        category = 'symbol'
      elsif name =~ /^\d/ || name =~ /^[０-９]/
        category = 'number'
      elsif name.match?(/^[ぁ-ん]/)
        category = 'hiragana'
        detail_category = name.to_seion.first
      elsif name.match?(/^[ァ-ヴ]/)
        category = 'katakana'
        detail_category = name.to_seion.first.to_hiragana
      elsif name.match?(/^[一-龠々]/)
        category = 'kanji'
      elsif name.match?(/^[a-zA-Zａ-ｚＡ-Ｚ]/)
        category = 'alphabet'
        detail_category = Moji.zen_to_han(name).first.upcase
      else
        category = 'symbol'
      end
      return category, detail_category
    end
  end
end
