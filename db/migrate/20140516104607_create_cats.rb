class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :catador
      t.integer :brillo
      t.integer :rojo
      t.integer :olfato
      t.integer :retro_olfato
      t.integer :peridental
      t.integer :palatina
      t.integer :lingual
      t.integer :retrogusto
      t.integer :complemento_blanco
      t.integer :complemento_tinto
      t.integer :total
      t.integer :vino_id
      t.string :amarillo
      t.string :email

      t.timestamps
    end
    add_index :cats, [:vino_id, :created_at]
  end
end
