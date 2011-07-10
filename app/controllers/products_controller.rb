class ProductsController < ApplicationController

  before_filter :load_categories

  layout "site"

  def index
    @products = Product.get_products_filtered(params[:product_name], params[:category_name], params[:page])
    if request.xhr?
      render :json => { :status => "success", :obj_response => render_to_string(:partial => "products_list") }
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
