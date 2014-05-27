class AddGradosToVino < ActiveRecord::Migration
  def change
    add_column :vinos, :grados, :decimal
  end
end
