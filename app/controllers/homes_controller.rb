class HomesController < ApplicationController
  def top
  	@products = Product.where(status: true)
  end
end
