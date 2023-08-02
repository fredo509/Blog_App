class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |col|
      col.string :name
      col.string :photo
      col.text :bio
      col.integer :posts_counter, default: 0
      col.timestamps
      col.timestamps
    end
  end
end
