class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |col|
      col.text :text
      col.timestamps
    end
  end
end
