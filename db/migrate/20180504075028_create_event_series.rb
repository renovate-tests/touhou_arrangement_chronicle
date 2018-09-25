class CreateEventSeries < ActiveRecord::Migration[5.2]
  def change
    create_table :event_series, id: :uuid do |t|
      t.string :title_ja
      t.string :title_en
      t.integer :display_order, default: 0, null: false
      t.timestamps
    end
  end
end
