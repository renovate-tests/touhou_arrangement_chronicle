require 'rails_helper'

describe SongDecorator do
  subject { song }

  let(:song) { Song.new.extend SongDecorator }

  it { should be_a Song }
end
