class PagesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @topics = Topic.all.search(params[:keyword], params[:category]).order(sort_column + ' ' + sort_direction)
  end

  private
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
  end

  def sort_column
      Topic.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
end
