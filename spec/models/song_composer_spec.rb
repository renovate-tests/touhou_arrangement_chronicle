require 'rails_helper'

RSpec.describe SongComposer, type: :model do
  describe 'belongs_to' do
    it { is_expected.to belong_to(:song) }
    it { is_expected.to belong_to(:composer) }
  end
end
