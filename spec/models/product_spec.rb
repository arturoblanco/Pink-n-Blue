require 'spec_helper'

describe Product do
  context "Creating a product" do
    before :each do
      clean_models
    end
    context "with valid information" do
      before :each do
        @product = Factory.build(:product, :name => "Product 1")
      end
      it "should save the product successfully" do
        @product.save.should == true
        @product.should have(0).errors
        @product.name.should == "Product 1"
        Product.all.count.should == 1
      end
    end
    context "with invalid information" do
      before :each do
        product = Factory(:product, :name => "Produc 1")
        @new_product = Factory.build(:product, :name => product.name)
      end
      it "should validate uniqueness of name" do
        @new_product.save.should == false
        @new_product.should have(1).error_on(:name)
        Product.all.count.should == 1
      end
    end
  end

  private

  def clean_models
    Product.destroy_all
  end
end
