class AddImgUserToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :img_user, :string
  end
end
