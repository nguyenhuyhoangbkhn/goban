class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :hotel, index: true, foreign_key: true
      t.string :content
      t.string :image

      t.timestamps null: false
    end
  end
end
