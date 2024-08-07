class Notification < ApplicationRecord
  validates :message, presence: true
  validates :received_at, presence: true
  validates :task_details, presence: true
  validates :user_data, presence: true
end
