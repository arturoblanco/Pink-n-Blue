require 'spec_helper'

describe Subarticle do
  context "Creating a subarticle" do
    before :each do
      clear_models
    end
    context "with valid information" do
      before :each do
        @product = Factory :product, :name => "Product 1"
        @presentation = Factory :presentation, :name => "Presentation 1"
        @article = Factory :article, :name => "Article 1"
        @subarticle = Factory.build :subarticle, :product_id => @product.id, :presentation_id => @presentation.id, :article_id => @subarticle_id
      end
      it "should save the subarticle if the associated products exists" do
        @subarticle.save.should == true
        @subarticle.should have(0).errors
        Subarticle.all.count.should == 1
      end
    end
    context "with invalid information" do
    end
  end

  private

  def clear_models
    Product.destroy_all
    Presentation.destroy_all
    Article.destroy_all
    Subarticle.destroy_all
  end
end
