class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true

  enum priority: {low: 0, high: 1}
  enum status: {no_touch: 0, processing: 1, done: 2}

  belongs_to :user

  scope :search, -> (title, priority, status, schedule_date, start_date, end_date, created_at) {
    where("(topics.title LIKE ? AND topics.priority LIKE ? AND topics.status LIKE ? AND topics.schedule_date LIKE ? AND topics.start_date LIKE ? AND topics.end_date LIKE ? AND topics.created_at LIKE ?)", "%#{title}%", "%#{priority}%", "%#{status}%", "%#{schedule_date}%", "%#{start_date}%", "%#{end_date}%", "%#{created_at}%") if title.present? || priority.present? || status.present? || schedule_date.present? || start_date.present? || end_date.present? || created_at.present?
  }
end
