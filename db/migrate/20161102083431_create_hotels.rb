class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name	
      t.integer :countRoom	
      t.text :introduction	
      t.string :kind	
      t.decimal :price
      t.string :address
      t.string :building_name
      t.string :phone_number	
      t.string :websitehotel
      
      t.timestamps null: false
    end
  end
end
