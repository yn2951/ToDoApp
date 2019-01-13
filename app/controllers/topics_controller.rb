class TopicsController < ApplicationController
  def new
    @topic = Topic.new
    @topic.schedule_date = Date.today
  end

  def edit
    set_topic
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
    if set_topic.update(topic_params)
      redirect_to pages_path, success: '編集内容を保存しました'
    else
      flash.now[:danger] = "編集内容の保存に失敗しました"
      render :new
    end
  end

  def start_end
    if set_topic.no_touch?
      if set_topic.update(status: :processing, start_date: Date.today)
        redirect_back(fallback_location: root_path)
      else
        flash.now[:danger] = "編集内容の保存に失敗しました"
        redirect_back(fallback_location: root_path)
      end
    elsif set_topic.processing?
      if set_topic.update(status: :done, end_date: Date.today)
        redirect_back(fallback_location: root_path)
      else
        flash.now[:danger] = "編集内容の保存に失敗しました"
        redirect_back(fallback_location: root_path)
      end
    end
  end

  private
  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :description, :priority, :schedule_date)
  end
end
