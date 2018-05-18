class RearrangerSerializer < ApplicationSerializer
  attributes :name_ja
  belongs_to :artist
end
