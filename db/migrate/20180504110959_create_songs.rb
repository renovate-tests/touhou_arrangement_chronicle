class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs, id: :uuid do |t|
      t.string :title_ja, null: false
      t.string :title_en
      t.integer :track_number
      t.integer :length
      t.integer :bpm
      t.references :circle, type: :uuid, index: true
      t.references :discography, type: :uuid, index: true
      t.references :event, type: :uuid, index: true
      t.timestamps
    end
  end
end
