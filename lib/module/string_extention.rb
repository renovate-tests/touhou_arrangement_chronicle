class String
  def to_hiragana
    self.tr('ァ-ン', 'ぁ-ん')
  end

  def to_katakana
    self.tr('ぁ-ん', 'ァ-ン')
  end

  def to_seion
    self.tr('ぁぃぅぇぉゃゅょゎ', 'あいうえおやゆよわ').
      tr('がぎぐげござじずぜぞだぢづでどばびぶべぼ', 'かきくけこさしすせそたちつてとはひふへほ').
      tr('ぱぴぷぺぽ', 'はひふへほ').
      tr('ァィゥェォャュョヮ', 'アイウエオヤユヨワ').
      tr('ガギグゲゴザジズゼゾダヂヅデドバビブベボ', 'カキクケコサシスセソタチツテトハヒフヘホ').
      tr('パピプペポ', 'ハヒフヘホ')
  end

  def to_int
    self.to_i if self =~ /\A-?(?:\d|[1-9]\d+)\z/
  end
end
