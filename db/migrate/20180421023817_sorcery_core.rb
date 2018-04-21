class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name, null: false
      t.string :email
      t.string :crypted_password
      t.string :salt

      t.timestamps null: false
    end

    add_index :users, :name, unique: true
    add_index :users, :email, unique: true
  end
end
