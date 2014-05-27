class AddNumCatasToVino < ActiveRecord::Migration
  def change
    add_column :vinos, :num_catas, :integer
    add_column :vinos, :cat_may, :integer
    add_column :vinos, :cat_min, :integer
    add_column :vinos, :cat_med, :integer
  end
end
