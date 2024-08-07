class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.text :message
      t.datetime :received_at
      t.text :task_details
      t.text :user_data

      t.timestamps
    end
  end
end
