# == Schema Information
#
# Table name: vocalists
#
#  id         :uuid             not null, primary key
#  artist_id  :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_vocalists_on_artist_id  (artist_id)
#

class Vocalist < ApplicationRecord
  include ArtistModule

  belongs_to :artist
end
