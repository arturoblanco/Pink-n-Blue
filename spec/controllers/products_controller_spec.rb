require 'spec_helper'

describe ProductsController do

  it {{ :get => "/products" }.should route_to(:controller => "products", :action => "index")}

  context "On GET to #index" do
    it "should respond with success" do
      get :index
      response.should be_success
    end
    it "should get a list of all available products" do
      get :index
      assigns(:products).should_not be_nil
    end
  end

end
