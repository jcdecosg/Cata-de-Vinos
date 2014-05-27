class CreateVinos < ActiveRecord::Migration
  def change
    create_table :vinos do |t|
      t.string :vino
      t.string :zona
      t.string :tipo
      t.integer :anno

      t.timestamps
    end
  end
end
