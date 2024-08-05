class Notification < ApplicationRecord
  validates :task_id, :task_name, :task_description, :user_id, :action, presence: true

end
