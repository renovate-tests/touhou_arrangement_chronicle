class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists, id: :uuid do |t|
      t.string :name_ja, null: false
      t.string :name_en
      t.string :site_url
      t.string :blog_url
      t.text :note_ja
      t.text :note_en
      t.string :category, null: false
      t.string :detail_category, null: false
      t.references :circle, type: :uuid, index: true
      t.references :user, type: :uuid, index: true

      t.timestamps
    end
  end
end
