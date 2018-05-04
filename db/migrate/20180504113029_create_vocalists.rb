class CreateVocalists < ActiveRecord::Migration[5.2]
  def change
    create_table :vocalists, id: :uuid do |t|
      t.references :artist, null: false, type: :uuid, index: true

      t.timestamps
    end
  end
end
