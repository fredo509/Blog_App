class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |col|
      col.string :title
      col.text :text
      col.integer :comments_count
      col.integer :likes_count
      col.references :user, null: false, foreign_key: true
      col.timestamps
    end
  end
end
