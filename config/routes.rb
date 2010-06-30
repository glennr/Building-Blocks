ActionController::Routing::Routes.draw do |map|

  map.resources :children

  map.namespace :mybb do |mybb|
    mybb.resources :sponsorships
  end

  map.static_page ':page',
    :controller => 'static_page',
    :action => 'show',
    :page => Regexp.new(%w[about contact sponsorship].join('|'))

  map.root :controller => 'home', :action => 'index' # a replacement for public/index.html, with unique layout

end
