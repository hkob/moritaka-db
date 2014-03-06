class AddIndexToTables < ActiveRecord::Migration
  def change
    add_index :titles, :yomi_suuji
    add_index :titles, :japanese, unique:true
    add_index :instrumentals, :sort_order
    add_index :years, :year
  end
end
