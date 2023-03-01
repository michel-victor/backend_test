class CreatePurchaseOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_options do |t|
      t.references :content, null: false, foreign_key: true
      t.decimal :price, precision: 8, scale: 2
      t.integer :quality

      t.timestamps
    end
  end
end
