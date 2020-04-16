class LibrariesController < ApplicationController
  def show
    @assets = Asset.where(library_id: current_library.id)

    case params[:sort]
      when 'created_at_desc'
        @assets = @assets.created_at_desc
      when "created_at_asc"
        @assets = @assets.created_at_asc
      when 'title_asc'
        @assets = @assets.title_asc
      when 'title_desc'
        @assets = @assets.title_desc
    end

    if params[:filter] && params[:filter] != 'all'
      @assets = @assets.where(file_type: params[:filter])
    end

    @assets
  end

  def index
    @libraries = Library.all
    render layout: 'library_dashboard'
  end

  def activity
    @activity = current_library.activities
    @activity = current_library.activities.order(created_at: :desc)

    render partial: 'shared/activity_list', layout: false if request.xhr?
  end

  def info
    render layout: false if request.xhr?
  end

  private
end
