class CreateInstrumentals < ActiveRecord::Migration
  def change
    create_table :instrumentals do |t|
      t.integer :sort_order, null:false
      t.integer :title_id, null:false

      t.timestamps
    end
  end
end
