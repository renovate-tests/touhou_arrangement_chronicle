require 'rails_helper'

RSpec.describe Collection, type: :model do
  describe 'belongs_to' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:discography) }
  end
end
