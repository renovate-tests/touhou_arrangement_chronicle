class ArrangerSerializer < ApplicationSerializer
  attributes :name_ja
  belongs_to :artist
end
