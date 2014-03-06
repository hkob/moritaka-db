class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :title_id, null:false
      t.integer :parent_id
      t.integer :year_id, null:false
      t.date :date
      t.timestamps
    end
    add_index :songs, [ :year_id, :date ]
  end
end
