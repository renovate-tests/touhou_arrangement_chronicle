# == Schema Information
#
# Table name: authentications
#
#  id         :uuid             not null, primary key
#  user_id    :uuid             not null
#  provider   :string           not null
#  uid        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_authentications_on_provider_and_uid  (provider,uid)
#  index_authentications_on_user_id           (user_id)
#

class Authentication < ApplicationRecord
  belongs_to :user
end
