class CreateMyGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :my_galleries do |t|
      t.text :description
      t.text :tag
      t.integer :work_id
      t.integer :user_id

      t.timestamps
    end
  end
end
