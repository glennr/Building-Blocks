require File.dirname(__FILE__) + '/../spec_helper'

describe Sponsorship do
  #it { should belong_to(:user) }
  it { should belong_to(:child) }
  
  context "creating a valid record" do
    subject { Factory(:sponsorship) }
    #it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:child_id) }
    it { should validate_presence_of(:amount) }
    #it { should validate_presence_of(:purchase_id) }
    
    it "new instance should be valid" do
      Factory.create(:sponsorship).should be_valid
    end    
  end
  
  context "creating an invalid record" do
    it "should not be valid" do
      sponsorship = Factory.build(:invalid_sponsorship)
      sponsorship.should_not be_valid
      sponsorship.errors.full_messages.first.should =~ /Child can't be blank/
      sponsorship.should have(1).error
    end    
  end

end
