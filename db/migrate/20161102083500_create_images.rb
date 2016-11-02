class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :hotels, index: true, foreign_key: true
      t.string :image

      t.timestamps null: false
    end
  end
end
