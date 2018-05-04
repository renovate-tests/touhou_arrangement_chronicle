class CreateArrangers < ActiveRecord::Migration[5.2]
  def change
    create_table :arrangers, id: :uuid do |t|
      t.references :artist, null: false, type: :uuid, index: true

      t.timestamps
    end
  end
end
