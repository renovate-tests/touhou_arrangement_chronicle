class CreateSongArrangers < ActiveRecord::Migration[5.2]
  def change
    create_table :song_arrangers, id: :uuid do |t|
      t.references :song, null: false, type: :uuid, index: true, foreign_key: true
      t.references :arranger, null: false, type: :uuid, index: true, foreign_key: true
      t.timestamps
    end
  end
end
