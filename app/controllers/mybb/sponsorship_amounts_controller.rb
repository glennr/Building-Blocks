class Mybb::SponsorshipAmountsController < ApplicationController

  def show
    redirect_to :action => 'edit'
  end

  def edit
    @unpaid_sponsorships ||= Sponsorship.all
  end

  def update
    redirect_to :action => 'edit'
  end

  protected

  def unpaid_donations
    #TODO @unpaid_donations ||= current_user.donations.unpaid
    @unpaid_sponsorships ||= sponsorships.unpaid
  end


end