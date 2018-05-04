# == Schema Information
#
# Table name: composers
#
#  id         :uuid             not null, primary key
#  artist_id  :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_composers_on_artist_id  (artist_id) UNIQUE
#

class Composer < ApplicationRecord
  include ArtistModule

  belongs_to :artist
end
