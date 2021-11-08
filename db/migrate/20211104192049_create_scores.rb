class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.integer :user_id
      t.integer :course_id
      t.integer :score
      t.date :date
    end
  end
end
