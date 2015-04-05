class PaypalInstantPaymentNotificationsController < ApplicationController
  protect_from_forgery except: [:create]

  def create
    product_id = params[:item_number]
    PaypalInstantPaymentNotification.create!(
        params: params.to_s,
        product_id: product_id,
        status: params[:payment_status],
        transaction_id: params[:txn_id]
    )
    product = Product.find(product_id)
    AdminMailer.paid(product).deliver if product.paid?

    render nothing: true
  end

end