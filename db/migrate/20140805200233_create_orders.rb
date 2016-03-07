class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :total

      t.integer :user_id
      t.integer :cart_id

      t.timestamps null: false
    end
  end
end
