class AddRead < ActiveRecord::Migration[6.1]
  def change
    change_table :emails do |t|
      t.boolean :read, default: "false"
    end  
  end
end
