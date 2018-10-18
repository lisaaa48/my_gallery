class AddLatitudeToHolder < ActiveRecord::Migration[5.2]
  def change
    add_column :holders, :latitude, :float
  end
end
