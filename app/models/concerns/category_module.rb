module CategoryModule
  extend ActiveSupport::Concern
  included do
    before_create :set_category
    enum category: {
      symbol: 'symbol',
      number: 'number',
      hiragana: 'hiragana',
      katakana: 'katakana',
      kanji: 'kanji',
      alphabet: 'alphabet',
      other: 'other',
    }
  end

  def set_category
    category, detail_category = Category.select_category(self.name_ja)
    self.category = category
    self.detail_category = detail_category
  end
end
