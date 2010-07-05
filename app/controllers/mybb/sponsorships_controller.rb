class Mybb::SponsorshipsController < InheritedResources::Base

  #actions :index, :show, :new, :edit, :create, :update, :destroy
  actions :create, :destroy
  respond_to :html, :js, :xml, :json

  def create
    create!(:notice => "") { mybb_sponsorships_amounts_url } #redirect to index action
  end

  def destroy
    destroy! { edit_mybb_sponsorships_amounts_url } #redirect to index action
  end

  protected

  def collection
    paginate_options ||= {}
    paginate_options[:page] ||= (params[:page] || 1)
    paginate_options[:per_page] ||= (params[:per_page] || 20)
    @sponsorships ||= end_of_association_chain.paginate(paginate_options)
  end

end