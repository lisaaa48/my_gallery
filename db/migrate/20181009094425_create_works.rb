class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.text :img_id
      t.string :titile
      t.string :author
      t.string :production_year
      t.string :tool
      t.integer :width
      t.integer :height
      t.text :tag
      t.integer :period_id
      t.integer :holder_id

      t.timestamps
    end
  end
end
