class CreatePins < ActiveRecord::Migration[5.2]
  def change
    create_table :pins do |t|
      t.integer :work_id
      t.text :note
      t.integer :value_x
      t.integer :value_y

      t.timestamps
    end
  end
end
