# == Schema Information
#
# Table name: collections
#
#  id             :uuid             not null, primary key
#  user_id        :uuid             not null
#  discography_id :uuid             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_collections_on_discography_id  (discography_id)
#  index_collections_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (discography_id => discographies.id)
#  fk_rails_...  (user_id => users.id)
#

class Collection < ApplicationRecord
  belongs_to :user
  belongs_to :discography
end
