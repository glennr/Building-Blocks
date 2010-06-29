require File.dirname(__FILE__) + '/../spec_helper'

describe Sponsorship do
  #it { should belong_to(:user) }
  it { should belong_to(:child) }
  
  describe "creating a record" do
    subject { Factory(:sponsorship) }
    #it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:child_id) }
    #it { should validate_presence_of(:purchase_id) }
    
    it "new instance should be valid" do
      Factory.create(:sponsorship).should be_valid
    end
    
  end

end
