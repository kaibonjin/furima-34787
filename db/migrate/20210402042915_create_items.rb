class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :item_name, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_cost_id, null: false
      t.integer :prefecture_id, null: false
      t.interger :days_til_ship_id, null: false
      t.price :integer, null: false
      t.timestamps
    end
  end
end
