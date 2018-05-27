require 'rails_helper'

RSpec.describe SongDecorator do
  subject { song }

  let(:song) { Song.new.extend SongDecorator }

  it { should be_a Song }
end
