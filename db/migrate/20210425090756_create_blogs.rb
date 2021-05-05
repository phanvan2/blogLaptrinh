class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.integer :idUser
      t.string :idCategory
      t.string :title
      t.string :abstract
      t.string :content
      t.string :img
      t.integer :status

      t.timestamps
    end
  end
end
