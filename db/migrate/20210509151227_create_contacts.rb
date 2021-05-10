class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :fullname
      t.string :email
      t.string :phone
      t.string :content

      t.timestamps
    end
  end
end
