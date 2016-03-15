class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :group
      t.datetime :start
      t.datetime :end

      t.timestamps null: false
    end
  end
end
