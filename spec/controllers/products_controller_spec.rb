require 'spec_helper'

describe ProductsController do

  it {{ :get => "/products" }.should route_to(:controller => "products", :action => "index")}
  it {{ :get => "/products/1"}.should route_to(:controller => "products", :action => "show", :id => "1")}

  context "On GET to #index" do
    it "should respond with success" do
    end
    it "should preload all the available categories" do
    end
    it "should get a list of all available products" do
    end
  end

  context "on XHR GET to #products" do
    it "should respond with success" do
    end
    it "should preload all the categories availables" do
    end
  end

end
