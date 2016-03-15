class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.index :id
      t.string :grouptype
    end
    add_index
  end
end
