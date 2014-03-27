class AddUniqueIndexToTables < ActiveRecord::Migration
  def change
    remove_index :years, column:[ :year ]
    add_index :years, [ :year ], unique:true
    add_index :instrumentals, [ :title_id ], unique:true
    add_index :people, [ :title_id ], unique:true
    add_index :songs, [ :title_id ], unique:true
    remove_index :lyrics, column:[ :song_id, :person_id ]
    add_index :lyrics, [ :song_id, :person_id ], unique:true
    remove_index :musics, column:[ :song_id, :person_id ]
    add_index :musics, [ :song_id, :person_id ], unique:true
    add_index :devices, [ :title_id ], unique:true
  end
end
