require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'has_many' do
    it { is_expected.to have_many(:discographies) }
    it { is_expected.to have_many(:songs) }
  end

  describe 'belongs_to' do
    it { is_expected.to belong_to(:event_series) }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:title_ja).to(:event_series).with_prefix(true) }
    it { is_expected.to delegate_method(:title_en).to(:event_series).with_prefix(true) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:title_ja) }
    it { is_expected.to validate_presence_of(:display_title_ja) }
  end
end
