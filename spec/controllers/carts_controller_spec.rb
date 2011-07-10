require 'spec_helper'

describe CartsController do

  it {{ :get => "/carts/12345"}.should route_to(:controller => "carts", :action => "show", :id => "12345")}

  context "on GET to #show" do
    it "should respond with success" do
      get :show, :id => "12345"
      response.should be_success
    end
  end

end
