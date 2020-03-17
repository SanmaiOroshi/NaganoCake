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
    # 画面から受け取ったパラメータが文字列になってしまったので無理やり変換
    params[:product][:status] = ActiveRecord::Type::Boolean.new.cast(params[:product][:status])

    product = Product.new(product_params)
    if product.save
      redirect_to admin_product_path(product)
    else
      @product = Product.new
      render 'new'
    end
    # binding.pry

  end

  def edit
    @product = Product.find(params[:id])
    # binding.pry
  end


  def update
    # 画面から受け取ったパラメータが文字列になってしまったので無理やり変換
    params[:product][:status] = ActiveRecord::Type::Boolean.new.cast(params[:product][:status])
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
