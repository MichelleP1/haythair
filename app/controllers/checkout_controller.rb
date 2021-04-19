class CheckoutController < ApplicationController
  before_action :authenticate_user!

  def index
    @province = User.find(current_user.id).province_id
  end

  def show
  end

  def create
    # Load up the product the user wishes to purchase from the product model:
    # product = Product.find(params[:product_id])

    # if product.nil?
    #   redirect_to root_path
    #   return
    # end

    @order_id = 76
    @order = Order.find(@order_id)
    @order_items = @order.order_items


    list_items_array = []

    @order_items.each do |item|
      logger.debug(item.furniture_id)
      list_items_array << {name: "Test", amount: 123.00, currency: "cad", quantity: 1}
    end

    # Establish a connection with Stripe and then redirect the user to the payment screen.
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url:          checkout_success_url,
      cancel_url:           checkout_cancel_url,
      line_items:           [
        {
          name:        "TEST",
          description: "TEST",
          amount:      1212,
          currency:    "cad",
          quantity:    1
        },
        {
          name:        "GST",
          description: "Goods and Services Tax",
          amount:      1221,
          currency:    "cad",
          quantity:    1
        }
      ]
    )

    # ensure it formats the response as .js instead of .html:
    respond_to do |format|
      format.js # render app/views/checkout/create.js.erb
    end
  end

  def success
    # We took the customer's money!
  end

  def cancel
    # Something went wrong with the payment :(
  end

  def checkout_params
    params.permit(:order_id, :pst, :hst, :gst)
  end

end



# @session = Stripe::Checkout::Session.create(
#   payment_method_types: ["card"],
#   success_url:          checkout_success_url,
#   cancel_url:           checkout_cancel_url,
#   line_items:           [
#     {
#       name:        product.name,
#       description: product.description,
#       amount:      product.price_cents,
#       currency:    "cad",
#       quantity:    1 # hard coded to 1 for OUR DEMO ONLY
#     },
#     {
#       name:        "GST",
#       description: "Goods and Services Tax",
#       amount:      (product.price_cents * 0.05).to_i,
#       quantity:    1
#     }
#   ]
# )


# @session = Stripe::Checkout::Session.create(
#   payment_method_types: ["card"],
#   success_url:          checkout_success_url,
#   cancel_url:           checkout_cancel_url,
#   line_items:           list_items_array
# )