require 'spec_helper'

describe Article do
  context "Creating an article" do
    before :each do
      clear_models
    end
    context "with valid params" do
      before :each do
        @article = Factory.build(:article, :name => "Article 1")
      end
      it "should save the article" do
        @article.save.should == true
        @article.should have(0).errors
        @article.name.should == "Article 1"
        Article.all.count.should == 1
      end
    end
    context "with invalid params" do
      before :each do
        article = Factory :article, :name => "Article 1"
        @new_article = Factory.build :article, :name => article.name
      end
      it "should validate uniqueness of name" do
        @new_article.save.should == false
        @new_article.should have(1).error_on(:name)
        Article.all.count.should == 1
      end
    end
  end

  private

  def clear_models
    Article.destroy_all
  end
end
