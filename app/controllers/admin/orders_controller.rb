class Admin::OrdersController < ApplicationController
    def index
        @orders = Order.all
    end

    def show

    end

    def update
        @order_status = Order.status
    end

end
