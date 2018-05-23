require 'rails_helper'

describe DiscographyDecorator do
  subject { discography }

  let(:discography) { Discography.new.extend DiscographyDecorator }

  it { should be_a Discography }
end
