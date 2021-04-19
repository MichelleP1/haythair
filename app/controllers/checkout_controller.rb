class CheckoutController < ApplicationController
  before_action :authenticate_user!

  def index
    @province = User.find(current_user.id).province_id
  end

  def show
  end

  def create

    list_items_array = []
    @subtotal = 0

    session[:shopping_cart].each do |furniture|
      list_items_array << {name: Furniture.find(furniture[0]).title, amount: (Furniture.find(furniture[0]).price * 100).to_i, currency: "cad", quantity: furniture[1] }
      @subtotal = @subtotal + (Furniture.find(furniture[0]).price * furniture[1])
      logger.debug(@subtotal)
    end

    @pst = (@subtotal * Province.find(current_user.province_id).pst * 0.01)
    @hst = (@subtotal * Province.find(current_user.province_id).hst * 0.01)
    @gst = (@subtotal * Province.find(current_user.province_id).gst * 0.01)

    if Province.find(current_user.province_id).pst > 0
      list_items_array << {name: "PST", amount: (@pst * 100).to_i, currency: "cad", quantity: 1 }
    end

    if Province.find(current_user.province_id).hst > 0
      list_items_array << {name: "HST", amount: (@hst * 100).to_i, currency: "cad", quantity: 1 }
    end

    if Province.find(current_user.province_id).gst > 0
      list_items_array << {name: "GST", amount: (@gst * 100).to_i, currency: "cad", quantity: 1 }
    end

    # Establish a connection with Stripe and then redirect the user to the payment screen.
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url:          checkout_success_url,
      cancel_url:           checkout_cancel_url,
      line_items:           list_items_array
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

