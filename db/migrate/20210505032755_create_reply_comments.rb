class CreateReplyComments < ActiveRecord::Migration[6.1]
  def change
    create_table :reply_comments do |t|
      t.integer :idUser
      t.integer :idComment
      t.string :content

      t.timestamps
    end
  end
end
