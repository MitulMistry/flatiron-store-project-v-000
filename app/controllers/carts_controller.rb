class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    if !current_cart
      #initialize_cart
      #redirect_to store_path
    end
  end

  def checkout
    @cart = current_user.current_cart
    @cart.checkout

    current_user.current_cart = nil
    if @cart.save && current_user.save
      respond_to do |format|
        format.html { redirect_to cart_path(@cart), notice: 'Thanks for your order!' }
      end
    end
  end
end
