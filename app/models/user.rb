# == Schema Information
#
# Table name: users
#
#  id               :uuid             not null, primary key
#  username         :string           not null
#  email            :string
#  crypted_password :string
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ApplicationRecord
  authenticates_with_sorcery!
end
