class CreatePaypalInstantPaymentNotifications < ActiveRecord::Migration
  def change
    create_table :paypal_instant_payment_notifications do |t|
      t.text :params
      t.integer :product_id
      t.string :status
      t.string :transaction_id

      t.timestamps
    end
  end
end
