module CategoryParameter
  extend ActiveSupport::Concern

  def initialize(params = {})
    params.assert_valid_keys("category", "detail_category")
    @category = params[:category].presence
    @detail_category = params[:detail_category].presence || ""
  end

  def define_params
    {
      category: @category,
      detail_category: @detail_category,
    }.with_indifferent_access.freeze
  end
end
