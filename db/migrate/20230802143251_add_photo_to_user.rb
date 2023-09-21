class AddPhotoToUser < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |col|
      col.string :photo
      col.text :bio
      col.integer :number_of_post, default: 0
    end
  end
end
