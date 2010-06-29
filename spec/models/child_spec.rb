require File.dirname(__FILE__) + '/../spec_helper'

describe Child do
  
  subject { Factory(:child) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:likes) }
  
  it "new instance should be valid" do
    Factory.create(:child).should be_valid
  end

end
