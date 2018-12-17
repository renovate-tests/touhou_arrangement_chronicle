FactoryBot.define do
  factory :arranger do
    transient do
      name_ja { nil }
    end
    artist { create(:artist, name_ja: name_ja) }
  end
end
