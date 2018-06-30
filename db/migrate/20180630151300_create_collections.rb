class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections, id: :uuid do |t|
      t.references :user, null: false, type: :uuid, index: true, foreign_key: true
      t.references :discography, null: false, type: :uuid, index: true, foreign_key: true
      t.timestamps
    end
  end
end
