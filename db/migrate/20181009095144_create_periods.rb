class CreatePeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :periods do |t|
      t.string :time_frame

      t.timestamps
    end
  end
end
