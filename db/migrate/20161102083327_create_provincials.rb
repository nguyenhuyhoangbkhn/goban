class CreateProvincials < ActiveRecord::Migration
  def change
    create_table :provincials do |t|
      t.string :name
      t.integer :type

      t.timestamps null: false
    end
  end
end
