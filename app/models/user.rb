# == Schema Information
#
# Table name: users
#
#  id               :uuid             not null, primary key
#  name             :string           not null
#  email            :string
#  crypted_password :string
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#  index_users_on_name   (name) UNIQUE
#

class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :name, presence: true
  validates :name, length: { in: 2..20 }, format: { with: /\A[\w_.-]+\z/ }, uniqueness: true, allow_blank: true
  validates :email, presence: true
  validates :email, uniqueness: true, allow_blank: true
  validates :password, presence: true
  validates :password, length: { in: 4..72 }, allow_blank: true, if: -> { new_record? || changes[:crypted_password] }
end
