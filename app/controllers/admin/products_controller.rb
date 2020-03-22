class Admin::ProductsController < ApplicationController
  def index
    # 後々kaminariを導入
    @products = Product.all
    # binding.pry
  end

  def show
    @product = Product.find(params[:id])
    @genres = Genre.all
    # binding.pry
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    if product.save
      redirect_to admin_product_path(product)
    else
      @product = product
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
    # binding.pry
  end


  def update
    product = Product.find(params[:id])
    # binding.pry

    if product.update(product_params)
      redirect_to admin_product_path(params[:id])
    else
      @product = Product.find(params[:id])
      render 'edit'
    end
  end

private
  def product_params
    params.require(:product).permit(:image,:name,:unit_price,:description,:genre_id,:status)
  end

end
