class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.integer :song_id
      t.integer :person_id
      t.integer :sort_order
      t.timestamps
    end
    add_index :musics, [ :song_id, :sort_order ]
    add_index :musics, [ :song_id, :person_id ]
    add_index :musics, :person_id
  end
end
