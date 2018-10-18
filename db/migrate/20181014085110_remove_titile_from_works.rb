class RemoveTitileFromWorks < ActiveRecord::Migration[5.2]
  def change
    remove_column :works, :titile, :string
  end
end
