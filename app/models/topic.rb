class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :user

  scope :search, -> (keyword, category) {
    if keyword.present?
      if category == "created_at"
        where("(topics.created_at LIKE :keyword)", keyword: "%#{sanitize_sql_like(keyword)}%")
      elsif category == "title"
        where("(topics.title LIKE :keyword)", keyword: "%#{sanitize_sql_like(keyword)}%")
      elsif category == "schedule_date"
        where("(topics.schedule_date LIKE :keyword)", keyword: "%#{sanitize_sql_like(keyword)}%")
      elsif category == "start_date"
        where("(topics.start_date LIKE :keyword)", keyword: "%#{sanitize_sql_like(keyword)}%")
      elsif category == "end_date"
        where("(topics.end_date LIKE :keyword)", keyword: "%#{sanitize_sql_like(keyword)}%")
      elsif category == "priority"
        where("(topics.priority LIKE :keyword)", keyword: "%#{sanitize_sql_like(keyword)}%")
      elsif category == "status"
        where("(topics.status LIKE :keyword)", keyword: "%#{sanitize_sql_like(keyword)}%")
      else
        all
      end
    end
  }
end
