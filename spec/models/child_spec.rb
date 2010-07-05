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
    
    it { should validate_presence_of(:picasa_album) }
    it { should validate_presence_of(:picasa_authkey) }

    it "new instance should be valid" do
      Factory.create(:child).should be_valid
    end
  end

  describe "setting the Picasa album using URL" do
  
    it "should accept a valid unlisted picasa URL" do
      url = "http://picasaweb.google.com/robertsgd/C3?authkey=Gv1sRgCJS9yvOi8ubAJA"
      @child = Factory(:child, :picasa_url => url)
      @child.picasa_album.should == "C3"
      @child.picasa_authkey.should == "Gv1sRgCJS9yvOi8ubAJA"
    end
  end
  
end
