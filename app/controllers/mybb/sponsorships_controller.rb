class Mybb::SponsorshipsController < InheritedResources::Base

  #actions :index, :show, :new, :edit, :create, :update, :destroy
  actions :create, :index
  respond_to :html, :js, :xml, :json

  def create
    create! (:notice => "You will be able to view his photos and full profile when you complete the sign-up process.") { mybb_sponsorships_url } #redirect to index action
  end


  protected

  def collection
    paginate_options ||= {}
    paginate_options[:page] ||= (params[:page] || 1)
    paginate_options[:per_page] ||= (params[:per_page] || 20)
    @sponsorships ||= end_of_association_chain.paginate(paginate_options)
  end

end