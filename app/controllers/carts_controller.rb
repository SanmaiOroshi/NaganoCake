class CartsController < ApplicationController

    def index
        @carts = Cart.all
    end

    def update
        @cart = Cart.find(params[:id])
        #@cart.units += cart_params[:units].to_i
        @cart.update(cart_params)
        redirect_to cart_path
    end

    def destroy
        @cart = Cart.find(params[:id])
        @cart.destroy
        redirect_to cart_path, notice: "カートが空になりました。"
    end

    private

    def cart_params
        params.require(:cart).permit(:units)
    end
end
