class SearchController < ApplicationController
  def index
    @members = HarryPotterService.new.order_of_phoenix_from(params[:house])
  end
end
