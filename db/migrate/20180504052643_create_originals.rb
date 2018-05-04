class CreateOriginals < ActiveRecord::Migration[5.2]
  def change
    create_table :originals, id: :uuid do |t|
      t.string :code, null: false
      t.string :title_ja
      t.string :title_en
      t.string :short_title_ja
      t.string :short_title_en
      t.string :original_type, null: false

      t.timestamps
      t.index :code, unique: true
    end
  end
end
