class Admin::OrdersController < ApplicationController
    def index
        @orders = Order.all
    end

    def show
        @order = Order.find(params[:id])
        @order_item = @order.ordered_products
    end

    def update
        @order = Order.find(params[:id])
        @order_status = params[:order][:status].to_i
        @order.update(status: @order_status)
        redirect_to root_path
        #明日ここからenumが数字でしか受け取ってくれない
    end




    
end
