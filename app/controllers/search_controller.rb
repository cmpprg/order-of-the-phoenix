class SearchController < ApplicationController
  def index
    @members = HarryPotterService.new.order_of_phoenix_from(params[:house])
  end

  private

  def gryfindor_order_members
    OrderMembers.new.return_collection('gryfindor')
  end
end
