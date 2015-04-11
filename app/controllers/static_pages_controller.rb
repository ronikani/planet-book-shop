class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def sale
  	@products = Product.all
  end

  def newbook
  	@products = Product.all
  end
end
