require File.dirname(__FILE__) + '/../spec_helper'
 
describe HomeController do
  integrate_views
  
   it "should show a favicon" do
     pending
     lambda { get '/images/favico.ico' }.should_not raise_error ActionController::RoutingError
   end
  
  context "on GET to :index" do  
    it "should find a random child" do
      @child = Factory.create(:child)
      Child.should_receive(:find).and_return @child
      get :index, :id => 1
      assert_equal 1, assigns(:child).id
    end
    
    context "on successful request" do
      before :each do
        @child = Factory.create(:child)
        get :index, :id => 1
      end
    
      it { should assign_to(:child) }
      it { should respond_with(:success) }
      it { should render_template(:index) }
      it { should_not set_the_flash }
    end
    
    context "render with no children in db" do
      before :each do
        get :index, :id => 1
      end
    
      it { should respond_with(:success) }
      it { should render_template(:index) }
      it { should_not set_the_flash }
    end
  end
end
