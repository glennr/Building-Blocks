# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include MinifyHTML
  include BounceBots

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  filter_parameter_logging :password, :password_confirmation, :credit_card_number

  before_filter :find_random_child

  before_filter :set_default_html_meta_tags
  after_filter :minify_html

  protected

  def find_random_child
    @random_child = Child.find :first, :offset => ( Child.count * rand ).to_i #random
  end

  def set_default_html_meta_tags
    begin
      @meta_description = APP_CONFIG[:meta][:description]
      @meta_keywords = APP_CONFIG[:meta][:keywords]
      @google_site_verification_key = APP_CONFIG[:google][:verification_code]
    rescue => e
      HoptoadNotifier.notify(
           :error_class   => "Special Error",
           :error_message => "Special Error: #{e.message}",
           :parameters    => APP_CONFIG
         )
    end
  end

  def html_meta_tags(meta_description = APP_CONFIG[:meta][:description], meta_keywords = APP_CONFIG[:meta][:keywords])
    @meta_description = "Spot.Us Community Report: " + strip_tags(meta_description)[0..180] if meta_description and !meta_description.blank?
    @meta_keywords = APP_CONFIG[:meta][:keywords] + ", " + meta_keywords if meta_keywords and !meta_keywords.blank?
  end

end
