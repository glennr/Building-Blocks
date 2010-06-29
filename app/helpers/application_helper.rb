module ApplicationHelper

  include Age

  # Usage: simply invoke title() at the top of each view
  # E.g.
  # - title "Home"
  def title(page_title)
    content_for(:title) { page_title }
  end

  # bit of bottleneck!
  def has_layout_partial(name)
    File.exists?( File.join( RAILS_ROOT, 'app', 'views', 'layouts', "_#{name}.html.haml" ) )
  end

  def shorten_likes(likes)
    # takes the first word out of the likes string
    likes.split(/(,|\s+)/).first.downcase
  end

end
