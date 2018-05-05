module CategoryModule
  extend ActiveSupport::Concern
  included do
    before_create :set_category
  end

  def set_category
    category, detail_category = Category.select_category(self.name_ja)
    self.category = category
    self.detail_category = detail_category
  end
end
