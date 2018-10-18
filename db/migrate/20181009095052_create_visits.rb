class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.date :visited_at
      t.integer :work_id
      t.integer :user_id

      t.timestamps
    end
  end
end
