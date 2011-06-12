class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :hola, :only => :index

  def hola
    if params[:filter_search_form]
      params[:filter_search_form].each do |key, value|
        params[key.to_sym] = value
      end
      params.delete(:filter_search_form)
    end
  end
end
