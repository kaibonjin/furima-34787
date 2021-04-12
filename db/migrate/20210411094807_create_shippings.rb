class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.references :order, foreign_key: true
      t.string :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city_town, null: false
      t.string :street, null: false
      t.string :building
      t.integer :phone, null: false
      t.timestamps
    end
  end
end
