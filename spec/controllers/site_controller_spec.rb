require 'spec_helper'

describe SiteController do

  it {{ :get => "/" }.should route_to(:controller => "site", :action => "index")}

  context "On GET to #index" do
    before :each do
      get :index
    end
    it "should respond with success" do
      response.should be_success
    end
    it "should render template index" do
      response.should render_template("index")
    end
  end

end
