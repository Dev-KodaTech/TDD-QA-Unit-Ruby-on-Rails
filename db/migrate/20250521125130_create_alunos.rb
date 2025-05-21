class CreateAlunos < ActiveRecord::Migration[8.0]
  def change
    create_table :alunos do |t|
      t.string :nome, limit: 100
      t.integer :matricula
      t.integer :idade
      t.datetime :data_nascimento

      t.timestamps
    end
  end
end
