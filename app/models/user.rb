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
#  image_path       :string
#  nick_name        :string
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#  index_users_on_name   (name) UNIQUE
#

class User < ApplicationRecord
  authenticates_with_sorcery!

  include Gravtastic
  gravtastic

  has_many :artists, inverse_of: :user, dependent: :destroy
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  validates :name, presence: true
  validates :name, length: { in: 2..20 }, format: { with: /\A[\w_.-]+\z/ }, uniqueness: true, allow_blank: true
  validates :email, presence: true
  validates :email, uniqueness: true, allow_blank: true
  validates :password, presence: true
  validates :password, length: { in: 4..72 }, allow_blank: true, if: -> { new_record? || changes[:crypted_password] }

  before_save :original_image

  private

    def original_image
      self.image_path&.gsub!('_normal.', '.')
    end
end
