class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :building_name
      t.integer :addressale_id	
      t.integer :addressale_type
      
      t.timestamps null: false
    end
  end
end
