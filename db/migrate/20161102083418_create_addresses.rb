class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :building_name
      t.references :village, index: true, foreign_key: true
      t.references :distric, index: true, foreign_key: true	
      t.references :provincial, index: true, foreign_key: true	
      t.integer :addressale_kind
      
      t.timestamps null: false
    end
  end
end
