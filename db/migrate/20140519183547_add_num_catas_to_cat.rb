class AddNumCatasToCat < ActiveRecord::Migration
  def change
    add_column :cats, :num_catas, :integer
    add_column :cats, :cat_may, :integer
    add_column :cats, :cat_min, :integer
    add_column :cats, :cat_med, :integer
  end
end
