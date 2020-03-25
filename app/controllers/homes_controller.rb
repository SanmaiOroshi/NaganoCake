class HomesController < ApplicationController
  def top
  	@products = Product.where(status: true)
  	@genres = Genre.where(display_status: true)
  end
end
