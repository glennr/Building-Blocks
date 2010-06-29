require File.dirname(__FILE__) + '/../spec_helper'

describe Child do
  
  describe "creating a child record" do
    subject { Factory(:child) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:likes) }
    it { should validate_presence_of(:gender) }
    it { should allow_value("M").for(:gender) }
    it { should allow_value("F").for(:gender) }
    it { should_not allow_value('male').for(:gender) }
    it { should_not allow_value('other').for(:gender) }
    
    it { should validate_presence_of(:birthday) }

    it "new instance should be valid" do
      Factory.create(:child).should be_valid
    end
    
  end

end
