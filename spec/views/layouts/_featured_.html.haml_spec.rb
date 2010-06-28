require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/layouts/_featured.html.haml" do
  include HomeHelper

  it "should render a title with the childs name" do
    render
    response.should contain("Meet Akash")
  end

  it "should render a link to sponsor a child now" do
    render
    response.should have_selector("a[href='/children/1']")
  end

end
