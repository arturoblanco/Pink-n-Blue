class ProductsController < ApplicationController

  before_filter :load_categories

  layout "site"

  def index
    @products = Product.where(:name.matches =>  "%#{params[:product_name]}%").page(params[:page]).per(1)
    if request.xhr?
      render :json => { :status => "success", :data => render_to_string(:partial => "products_list") }
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def load_categories
    @categories = Category.order("name DESC")
  end
end
