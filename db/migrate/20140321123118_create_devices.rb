class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :type
      t.integer :device_type
      t.integer :title_id
      t.date :date
      t.integer :minutes
      t.integer :seconds
      t.integer :sort_order
      t.string :number
      t.integer :year_id
      t.integer :singer_id
      t.string :j_comment
      t.string :e_comment

      t.timestamps
    end
    add_index :devices, [ :type, :device_type, :date ]
    add_index :devices, [ :year_id, :date ]
  end
end
