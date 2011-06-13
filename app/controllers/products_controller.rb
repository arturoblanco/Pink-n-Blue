class ProductsController < ApplicationController

  before_filter :load_categories

  respond_to :js

  layout "site"

  def index
    @products = Product.where(:name.matches =>  "%#{params[:product_name]}%").page(params[:page]).per(2)
  end

  private

  def load_categories
    @categories = Category.order("name DESC")
  end
end
