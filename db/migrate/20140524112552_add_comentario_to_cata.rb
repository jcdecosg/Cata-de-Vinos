class AddComentarioToCata < ActiveRecord::Migration
  def change
    add_column :cats, :comentario, :text
  end
end
