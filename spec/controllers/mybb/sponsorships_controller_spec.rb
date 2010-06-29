require File.dirname(__FILE__) + '/../../spec_helper'
 
describe Mybb::SponsorshipsController do
  integrate_views
  
  describe "on POST to create with valid input" do
    before :each do
      @child = Factory.create(:child)
      post :create, :sponsorship => {:child_id => @child.id }
    end
    
    it { should assign_to(:sponsorship) }
    it { should redirect_to("some path") { mybb_sponsorship_path(Sponsorship.first) }}
    it { should_not render_template(:edit) }
    it { should set_the_flash }
    
    it "should create a valid sponsorship" do
      assigns[:sponsorship].should be_valid
    end
    
    it "should associate sponsorship with the child" do
      assigns[:sponsorship].child.should == @child
    end

    it "should associate sponsorship with current user" do
      pending
      do_create
      assigns[:donation].user_id.should == @user.id
    end
  end
  
  
  
  context "edit action" do
    before :each do
      @sponsorship = Factory.create(:sponsorship)
      get :edit, :id => @sponsorship
    end

    it { should assign_to(:sponsorship) }
    it { should respond_with(:success) }
    it { should render_template(:edit) }
    it { should_not set_the_flash }
  end
  
  it "index action should render index template" do
    pending
    get :index
    response.should render_template(:index)
  end
  

  it "show action should render show template" do
    pending
    get :show, :id => Sponsorship.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    pending
    get :new
    response.should render_template(:new)
  end
  

  it "create action should render new template when model is invalid" do
    pending
    Sponsorship.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    pending
    Sponsorship.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(resource_url(assigns[:resource]))
  end
  
  it "update action should render edit template when model is invalid" do
    pending
    Sponsorship.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Sponsorship.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    pending
    Sponsorship.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Sponsorship.first
    response.should redirect_to(resource_url(assigns[:resource]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    pending
    resource = Sponsorship.first
    delete :destroy, :id => resource
    response.should redirect_to(resources_url)
    Sponsorship.exists?(resource.id).should be_false
  end
  
  context "on POST to create with invalid input" do
    subject { @sponsorship = Factory.build(:invalid_sponsorship) }
    before :each do
      request.env["HTTP_REFERER"] = '/'
      post :create, :sponsorship => { :child_id => 999 }
    end
    
    it { should set_the_flash.to("Error") }
    it { should redirect_to('/') }
    it { should render_template(:edit) }
  end
  

end
