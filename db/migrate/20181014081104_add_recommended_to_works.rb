class AddRecommendedToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :recomended, :text
  end
end
