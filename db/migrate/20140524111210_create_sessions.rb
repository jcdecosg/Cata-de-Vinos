class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :session_id
      t.string :data

      t.timestamps
    end
  end
end
