class CreateDistrics < ActiveRecord::Migration
  def change
    create_table :districs do |t|
      t.string :name
      t.references :provincial, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
