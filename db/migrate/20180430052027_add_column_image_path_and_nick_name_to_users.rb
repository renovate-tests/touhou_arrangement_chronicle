class AddColumnImagePathAndNickNameToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users, bulk: true do |t|
      t.string :image_path
      t.string :nick_name
    end
  end
end
