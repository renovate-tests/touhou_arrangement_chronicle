class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events, id: :uuid do |t|
      t.string :title_ja, null: false
      t.string :title_en
      t.string :display_title_ja, null: false
      t.string :display_title_en
      t.references :event_series, null: false, type: :uuid, index: true
      t.integer :times
      t.integer :days, default: 1, null: false
      t.date :date
      t.text :note_ja
      t.text :note_en
      t.timestamps
    end
  end
end
