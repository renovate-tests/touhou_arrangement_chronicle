require 'rails_helper'

RSpec.describe Song, type: :model do
  describe 'has_many' do
    it { is_expected.to have_many(:song_arrangers) }
    it { is_expected.to have_many(:arrangers) }
    it { is_expected.to have_many(:song_composers) }
    it { is_expected.to have_many(:composers) }
    it { is_expected.to have_many(:song_lyricists) }
    it { is_expected.to have_many(:lyricists) }
    it { is_expected.to have_many(:song_original_songs) }
    it { is_expected.to have_many(:original_songs) }
    it { is_expected.to have_many(:song_rearrangers) }
    it { is_expected.to have_many(:rearrangers) }
    it { is_expected.to have_many(:song_vocalists) }
    it { is_expected.to have_many(:vocalists) }
  end

  describe 'belongs_to' do
    it { is_expected.to belong_to(:circle).optional }
    it { is_expected.to belong_to(:discography).optional }
    it { is_expected.to belong_to(:event).optional }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:title_ja) }
  end
end
