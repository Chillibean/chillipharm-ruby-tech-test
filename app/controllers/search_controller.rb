class SearchController < ApplicationController
  def index
    @search_history = Search.where(user: current_user)
    render layout: 'search_history_dashboard'
  end

  def destroy
    @search = Search.find(params[:id])
    @search.destroy

    redirect_to search_path
  end
end
