class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.index :id
      t.string :grouptype
    end
  end
end
