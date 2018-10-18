class AddLongitudeToHolder < ActiveRecord::Migration[5.2]
  def change
    add_column :holders, :longitude, :float
  end
end
