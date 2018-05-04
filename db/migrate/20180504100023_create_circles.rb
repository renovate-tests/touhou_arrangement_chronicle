class CreateCircles < ActiveRecord::Migration[5.2]
  def change
    create_table :circles, id: :uuid do |t|
      t.string :name_ja, null: false
      t.string :name_en
      t.string :circle_type, null: false, default: 'general'
      t.string :site_url
      t.string :blog_url
      t.string :category, null: false
      t.string :detail_category, null: false
      t.text :note_ja
      t.text :note_en
      t.timestamps

      t.index :name_ja, unique: true
    end
  end
end
