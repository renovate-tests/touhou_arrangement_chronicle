class CreateSongVocalists < ActiveRecord::Migration[5.2]
  def change
    create_table :song_vocalists, id: :uuid do |t|
      t.references :song, null: false, type: :uuid, index: true, foreign_key: true
      t.references :vocalist, null: false, type: :uuid, index: true, foreign_key: true
      t.timestamps
    end
  end
end
