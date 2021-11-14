class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    puts 'ENVIRONMENT', ENV['USERNAME']
    puts 'ENVIRONMENT 2', ENV
  end

  def show
    @product = Product.find params[:id]
  end

end
