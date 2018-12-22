class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.date :start_date
      t.date :schedule_date
      t.date :end_date
      t.string :priority, default:"低"
      t.string :status, default:"未着手"

      t.timestamps
    end
  end
end
