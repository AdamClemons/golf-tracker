class CreateUserClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :user_clubs do |t|
      t.integer :user_id
      t.integer :club_id
    end
  end
end
