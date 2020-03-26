class ProductsController < ApplicationController

    def index
        @genres = Genre.where(display_status: true)

       	# もしURLに[:genre_id]が含まれていたら
  	  	if params[:genre_id]
  	  		# その[:genre_id]のデータをGenreから@genreに入れて
      		@genre = Genre.find(params[:genre_id])
			# @genreに紐付いた商品で販売可の商品を持ってくるイメージ
      		@products = @genre.products.order(created_at: :desc).where(status: true).page(params[:page]).per(8)
	    	# 含まれていなければ販売ステータスtrueを呼ぶ
		else
      		@products = Product.where(status: true).page(params[:page]).per(8)
	    end
    end


    def show
        @product = Product.find(params[:id])
        @genres = Genre.where(display_status: true)
        @cart = Cart.new

    end


end

