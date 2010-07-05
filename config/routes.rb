ActionController::Routing::Routes.draw do |map|

  map.resources :children

  #this must go before the sponsorships route
  map.resource :amounts, :name_prefix => 'mybb_sponsorships_',
                         :path_prefix => 'mybb/sponsorships',
                         :controller  => 'mybb/sponsorship_amounts'

  map.namespace :mybb do |mybb|
    mybb.resources :sponsorships
  end

  map.static_page ':page',
    :controller => 'static_page',
    :action => 'show',
    :page => Regexp.new(%w[about contact sponsorship step2].join('|'))

  map.root :controller => 'home', :action => 'index' # a replacement for public/index.html, with unique layout

end
