require 'rails_helper'

RSpec.describe EventDecorator do
  subject { event }

  let(:event) { Event.new.extend EventDecorator }

  it { should be_a Event }
end
