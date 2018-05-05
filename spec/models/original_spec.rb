require 'rails_helper'

RSpec.describe Original, type: :model do
  describe 'enums' do
    it {
      is_expected.to define_enum_for(:original_type).with_values(pc98: 'pc98',
                                                                 windows: 'windows',
                                                                 zuns_music_collection: 'zuns_music_collection',
                                                                 akyus_untouched_score: 'akyus_untouched_score',
                                                                 commercial_books: 'commercial_books',
                                                                 other: 'other').backed_by_column_of_type(:string)
    }
  end

  describe 'has_many' do
    it { is_expected.to have_many(:original_songs) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:title_ja) }
    it { is_expected.to validate_presence_of(:short_title_ja) }
    it { is_expected.to validate_presence_of(:original_type) }
  end
end
