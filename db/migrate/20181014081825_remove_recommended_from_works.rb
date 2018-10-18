class RemoveRecommendedFromWorks < ActiveRecord::Migration[5.2]
  def change
    remove_column :works, :recomended, :text
  end
end
