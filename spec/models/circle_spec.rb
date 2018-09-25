require 'rails_helper'

RSpec.describe Circle, type: :model do
  describe 'has_many' do
    it { is_expected.to have_many(:artists) }
    it { is_expected.to have_many(:discographies) }
    it { is_expected.to have_many(:songs) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:name_ja) }
  end
end
