class CreateObservacoes < ActiveRecord::Migration[5.0]
  def change
    create_table :observacoes do |t|
      t.string :descricao
      t.string :ano
      t.string :mes

      t.timestamps
    end
  end
end
