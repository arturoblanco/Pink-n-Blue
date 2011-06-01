require 'spec_helper'

describe Presentation do
  context "Creating a Presentation" do
    before :each do
      clean_models
    end
    context "with valid information" do
      before :each do
        @presentation = Factory.build :presentation, :name => "Presentation 1"
      end
      it "should save the presentation successfully" do
        @presentation.save.should == true
        @presentation.should have(0).errors
        @presentation.name.should == "Presentation 1"
        Presentation.all.count.should == 1
      end
    end
    context "with with valid information" do
      before :each do
        presentation = Factory(:presentation, :name => "Presentation 1")
        @new_presentation = Factory.build :presentation, :name => presentation.name
      end
      it "should validates uniqueness of name" do
        @new_presentation.save.should == false
        @new_presentation.should have(1).error_on(:name)
        Presentation.all.count.should == 1
      end
    end
  end

  private

  def clean_models
    Presentation.destroy_all
  end
end
