class PagesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    if current_user.present?
      @topics = Topic.where(user_id: current_user.id).search(params[:title], params[:priority], params[:status], params[:schedule_date], params[:start_date], params[:end_date], params[:created_at]).order(sort_column + ' ' + sort_direction)
    else
      @topics = Topic.where(user_id: nil)
    end
  end

  private
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
  end

  def sort_column
    Topic.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
end
