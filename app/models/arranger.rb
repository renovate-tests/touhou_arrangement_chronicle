# == Schema Information
#
# Table name: arrangers
#
#  id         :uuid             not null, primary key
#  artist_id  :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_arrangers_on_artist_id  (artist_id)
#

class Arranger < ApplicationRecord
  include ArtistModule

  belongs_to :artist
end
