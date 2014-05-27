class AddPrecioToVino < ActiveRecord::Migration
  def change
    add_column :vinos, :precio, :decimal
  end
end
