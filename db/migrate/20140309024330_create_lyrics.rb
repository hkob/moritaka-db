class CreateLyrics < ActiveRecord::Migration
  def change
    create_table :lyrics do |t|
      t.integer :song_id
      t.integer :person_id
      t.integer :sort_order
      t.timestamps
    end
    add_index :lyrics, [ :song_id, :sort_order ]
    add_index :lyrics, [ :song_id, :person_id ]
    add_index :lyrics, :person_id
  end
end
