require 'spec_helper'

describe Product do
  context "Creating a product" do
    context "with valid information" do
      before :each do
        @product = Factory.build(:product)
      end
      it "should save the product successfully" do
        @product.save.should == true
        @product.should have(0).errors
        Product.all.count.should == 1
      end
    end
    context "with invalid information" do
      it "should validate uniqueness of name" do
      end
    end
  end
end
