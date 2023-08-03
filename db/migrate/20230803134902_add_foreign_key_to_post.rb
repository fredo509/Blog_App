class AddForeignKeyToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :author, index: true
  end
end
