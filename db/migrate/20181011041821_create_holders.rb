class CreateHolders < ActiveRecord::Migration[5.2]
  def change
    create_table :holders do |t|
      t.string :location

      t.timestamps
    end
  end
end
