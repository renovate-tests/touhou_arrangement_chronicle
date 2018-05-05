class CreateDiscographies < ActiveRecord::Migration[5.2]
  def change
    create_table :discographies, id: :uuid do |t|
      t.string :title_ja, null: false
      t.string :title_en
      t.date :release_date
      t.references :circle, type: :uuid, index: true
      t.references :event, type: :uuid, index: true
      t.integer :part_number

      t.timestamps
    end
  end
end
