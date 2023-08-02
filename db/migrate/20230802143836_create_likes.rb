class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |col|
      col.references :user, null: false, foreign_key: true
      col.references :post, null: false, foreign_key: true
      col.timestamps
    end
  end
end
