# this is separate from StaticPageController since we use nested layouts
# which means the index page can have its own unique layout
class HomeController < ApplicationController
  def index
    @child = Child.find :first, :offset => ( Child.count * rand ).to_i #random
  end
end
