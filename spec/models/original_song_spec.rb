require 'rails_helper'

RSpec.describe OriginalSong, type: :model do
  describe 'has_many' do
    it { is_expected.to have_many(:song_original_songs) }
    it { is_expected.to have_many(:songs) }
  end

  describe 'belongs_to' do
    it { is_expected.to belong_to(:original) }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:title_ja).to(:original).with_prefix(true) }
    it { is_expected.to delegate_method(:title_en).to(:original).with_prefix(true) }
    it { is_expected.to delegate_method(:short_title_ja).to(:original).with_prefix(true) }
    it { is_expected.to delegate_method(:short_title_en).to(:original).with_prefix(true) }
    it { is_expected.to delegate_method(:original_type).to(:original).with_prefix(true) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:title_ja) }
    it { is_expected.to validate_presence_of(:original_code) }
  end
end
