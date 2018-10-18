class RemoveTagFromWorks < ActiveRecord::Migration[5.2]
  def change
    remove_column :works, :tag, :text
  end
end
