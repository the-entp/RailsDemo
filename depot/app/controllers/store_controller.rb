class StoreController < ApplicationController
  def index
  	@products = Product.all
  	@counter = increment_counter
  	
  end

  def increment_counter
  	session[:counter] ||= 0
  	session[:counter]+= 1
  	return session[:counter] if session[:counter] > 5
  	nil
  end
end
