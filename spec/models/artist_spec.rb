require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe 'has_one' do
    it { is_expected.to have_one(:vocalist) }
    it { is_expected.to have_one(:arranger) }
    it { is_expected.to have_one(:lyricist) }
    it { is_expected.to have_one(:composer) }
    it { is_expected.to have_one(:rearranger) }
  end

  describe 'belongs_to' do
    it { is_expected.to belong_to(:circle) }
    it { is_expected.to belong_to(:user) }
  end
end
