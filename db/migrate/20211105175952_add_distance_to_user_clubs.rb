class AddDistanceToUserClubs < ActiveRecord::Migration[5.2]
  def change
    add_column :user_clubs, :distance, :integer
  end
end
