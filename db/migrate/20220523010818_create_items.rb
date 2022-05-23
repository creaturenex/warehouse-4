class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :quantity
      t.decimal :price, precision: 10, scale: 2
      t.references :inventory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
