# == Schema Information
#
# Table name: rearrangers
#
#  id         :uuid             not null, primary key
#  artist_id  :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_rearrangers_on_artist_id  (artist_id) UNIQUE
#

class Rearranger < ApplicationRecord
  include ArtistModule

  belongs_to :artist
end
