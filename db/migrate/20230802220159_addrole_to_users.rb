class AddroleToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |col|
      col.string :role
    end  
  end
end
