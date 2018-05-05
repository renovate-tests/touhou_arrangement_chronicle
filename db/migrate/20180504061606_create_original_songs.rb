class CreateOriginalSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :original_songs, id: :uuid do |t|
      t.string :code, null: false
      t.string :title_ja
      t.string :title_en
      t.string :original_code, null: false
      t.string :composer
      t.integer :track_number
      t.boolean :is_duplicate, null: false, default: false
      t.boolean :is_hidden, null: false, default: false
      t.timestamps
      t.index :code, unique: true
      t.index :original_code
    end
  end
end
