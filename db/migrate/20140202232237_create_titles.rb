class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :japanese, null:false
      t.string :english, null:false
      t.string :yomi, null:false
      t.string :yomi_suuji, null:false

      t.timestamps
    end
  end
end
