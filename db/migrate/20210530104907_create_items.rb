class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_id, null: false
      t.integer :area_id, null: false
      t.integer :scheduled_delivery_id, null: false
      t.integer :category_id, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
