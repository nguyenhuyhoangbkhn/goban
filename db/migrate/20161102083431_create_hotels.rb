class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name	
      t.references :address, index: true, foreign_key: true	
      t.integer :countRoom	
      t.text :introduction	
      t.string :kind	
      t.decimal :price
      t.string :phone_number	
      t.string :websitehotel
      
      t.timestamps null: false
    end
  end
end
