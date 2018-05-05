require 'rails_helper'

RSpec.describe SongLyricist, type: :model do
  describe 'belongs_to' do
    it { is_expected.to belong_to(:song) }
    it { is_expected.to belong_to(:lyricist) }
  end
end
