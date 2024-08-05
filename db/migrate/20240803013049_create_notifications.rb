class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.integer :task_id
      t.string :task_name
      t.text :task_description
      t.integer :user_id
      t.string :action

      t.timestamps
    end
  end
end
