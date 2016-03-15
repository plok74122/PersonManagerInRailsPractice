class CreateCheckInLists < ActiveRecord::Migration
  def change
    create_table :check_in_lists do |t|
      t.integer :user_id
      t.integer :course_id
      t.timestamps :check_in
    end
  end
end
