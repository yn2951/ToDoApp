class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.date :start_date, default: "2018/12/24"
      t.date :schedule_date, default: "2018/12/24"
      t.date :end_date, default: "2018/12/24"
      t.integer :priority, default: 0, null: false, limit: 1
      t.integer :status, default: 0, null: false, limit: 1

      t.timestamps
    end
  end
end
