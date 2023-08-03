class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |col|
      col.string :title
      col.text :text
      col.integer :comments_counter, default: 0
      col.integer :likes_counter, default: 0
      col.timestamps
    end
  end
end
