class ProductsController < ApplicationController
  def index
    @brand = Brand.find(params[:brand_id])
    @products = @brand.products
  end

  def show
    @brand = Brand.find(params[:brand_id])
    @product = @brand.products.find(params[:id])
  end
end
