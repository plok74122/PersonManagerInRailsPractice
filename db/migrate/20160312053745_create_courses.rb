class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.index :id
      t.string:course_name
      t.string :group
      t.timestamp :start
      t.timestamp :end
    end
  end
end
