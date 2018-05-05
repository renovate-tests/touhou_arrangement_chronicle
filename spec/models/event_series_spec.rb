require 'rails_helper'

RSpec.describe EventSeries, type: :model do
  describe 'has_many' do
    it { is_expected.to have_many(:event) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:title_ja) }
  end
end
