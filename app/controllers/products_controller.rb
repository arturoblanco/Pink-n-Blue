class ProductsController < ApplicationController

  before_filter :load_categories

  layout "site"

  def index
    @products = Product.joins(:subcategories)
    .where(:subcategories => {:name.matches => "%#{params[:category_name]}%"}, :products => {:name.matches => "%#{params[:product_name]}%"})
    .page(params[:page]).per(1)
    #@products = Product.where{name =~ "#{params[:product_name]}"}.page(params[:page]).per(1)
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