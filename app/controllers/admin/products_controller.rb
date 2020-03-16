class Admin::ProductsController < ApplicationController
  def index
    # 後々kaminariを導入
    @products = Product.all
    # binding.pry
  end

  def show
    @product = Product.find(params[:id])
    # binding.pry
  end

  def new
    @product = Product.new
  end

  def create
    # binding.pry
    product = Product.create(product_params)
  end


  def update

  end

private
  def product_params
    params.require(:product).permit(:image,:name,:unit_price,:description,:genre_id)
  end

end
