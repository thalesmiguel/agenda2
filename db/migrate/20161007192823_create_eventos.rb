class CreateEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :eventos do |t|
      t.string :nome
      t.integer :canal
      t.integer :cidade_id
      t.datetime :data
      t.boolean :aprovado

      t.timestamps
    end
  end
end
