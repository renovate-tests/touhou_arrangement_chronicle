require 'rails_helper'

RSpec.describe Rearranger, type: :model do
  describe 'delegations' do
    it { is_expected.to delegate_method(:name_ja).to(:artist) }
    it { is_expected.to delegate_method(:name_en).to(:artist) }
    it { is_expected.to delegate_method(:site_url).to(:artist) }
    it { is_expected.to delegate_method(:blog_url).to(:artist) }
    it { is_expected.to delegate_method(:note_ja).to(:artist) }
    it { is_expected.to delegate_method(:note_en).to(:artist) }
    it { is_expected.to delegate_method(:category).to(:artist) }
    it { is_expected.to delegate_method(:detail_category).to(:artist) }
    it { is_expected.to delegate_method(:circle).to(:artist) }
    it { is_expected.to delegate_method(:user).to(:artist) }
  end

  describe 'has_many' do
    it { is_expected.to have_many(:song_rearrangers) }
    it { is_expected.to have_many(:songs) }
  end

  describe 'belongs_to' do
    it { is_expected.to belong_to(:artist) }
  end
end
