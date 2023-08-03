class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |col|
      col.timestamps
    end
  end
end
