require 'rails_helper'

RSpec.describe Discography, type: :model do
  describe 'has_many' do
    it { is_expected.to have_many(:songs) }
  end

  describe 'belongs_to' do
    it { is_expected.to belong_to(:circle) }
    it { is_expected.to belong_to(:event) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:title_ja) }
  end
end
