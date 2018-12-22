class Search
  include ActiveModel::Model

  attr_accessor :keyword, :category

  validates :keyword, format: { with: /\A[0-9]+\Z/ }, if: :judge?

  def judge
    category == "created_at" || category == "schedule_date" || category == "start_date" || category == "end_date"
  end
end
