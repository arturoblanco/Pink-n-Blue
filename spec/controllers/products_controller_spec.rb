require 'spec_helper'

describe ProductsController do

  it {{ :get => "/products" }.should route_to(:controller => "products", :action => "index")}

  context "On GET to #index" do
    it "should respond with success" do
      get :index
      response.should be_success
    end
    it "should preload all the available categories" do
      get :index
      assigns(:categories).should_not be_blank
    end
    it "should get a list of all available products" do
      get :index
      assigns(:products).should_not be_blank
    end
  end

  context "on XHR GET to #products" do
    it "should respond with success" do
    end
    it "should preload all the categories availables" do
    end
  end

end
