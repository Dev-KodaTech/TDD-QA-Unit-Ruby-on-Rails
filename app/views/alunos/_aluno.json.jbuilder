json.extract! aluno, :id, :nome, :matricula, :idade, :data_nascimento, :created_at, :updated_at
json.url aluno_url(aluno, format: :json)
