class CartsController < ApplicationController

    def index
        @carts = Cart.all
    end

    def create
        @cart = Cart.new(cart_params)
        @cart.user_id = current_user.id
        if @cart.save
            redirect_to carts_path, notice: "カートに商品が追加されました。"
        else
            @carts = Cart.all
            render 'index'
        end
    end

    def update
        @cart = Cart.find(params[:id])
        #@cart.units += cart_params[:units].to_i
        @cart.update(cart_params)
        redirect_to cart_path
    end

    def destroy
        cart = Cart.find(params[:id])
        cart.destroy
        redirect_to cart_path
    end

    def destroy_all
        @cart = current_user.carts
        @cart.destroy_all
        redirect_to cart_path, notice: "カートが空になりました。"
    end

    private

    def cart_params
        params.require(:cart).permit(:units,:product_id)
    end
end
