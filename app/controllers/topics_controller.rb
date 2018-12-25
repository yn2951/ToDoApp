class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to pages_path, success: '作成内容を保存しました'
    else
      flash.now[:danger] = "作成内容の保存に失敗しました"
      render :new
    end
  end

  def update
    if @topic = Topic.find(params[:id]).update(topic_params)
      redirect_to pages_path, success: '編集内容を保存しました'
    else
      flash.now[:danger] = "編集内容の保存に失敗しました"
      render :new
    end
  end

  def date_update
    if Topic.find(params[:id]).no_touch?
      if @topic = Topic.find(params[:id]).update(status: 1, start_date: Date.today)
        redirect_back(fallback_location: root_path)
      else
        flash.now[:danger] = "編集内容の保存に失敗しました"
        redirect_back(fallback_location: root_path)
      end
    elsif Topic.find(params[:id]).processing?
      if @topic = Topic.find(params[:id]).update(status: 2, end_date: Date.today)
        redirect_back(fallback_location: root_path)
      else
        flash.now[:danger] = "編集内容の保存に失敗しました"
        redirect_back(fallback_location: root_path)
      end
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :description, :priority, :schedule_date)
  end
end
