class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :title_id, null:false
      t.integer :parent_id
      t.timestamps
    end
  end
end
