require "test_helper"

class AlunoTest < ActiveSupport::TestCase
  def setup
    @aluno = Aluno.new(
      nome: "Maria Silva",
      matricula: 20250001,
      idade: 16,
      data_nascimento: Date.new(2009, 1, 1)
    )
  end

  # Testes para Nome
  test "deve salvar aluno com dados válidos" do
    assert @aluno.valid?
  end

  test "não deve salvar aluno sem nome" do
    @aluno.nome = nil
    assert_not @aluno.valid?
    assert_equal "não pode ficar em branco", @aluno.errors[:nome].first
  end

  test "não deve salvar nome com mais de 100 caracteres" do
    @aluno.nome = "a" * 101
    assert_not @aluno.valid?
    assert_equal "é muito longo (máximo: 100 caracteres)", @aluno.errors[:nome].first
  end

  # Testes para Matrícula
  test "não deve salvar aluno sem matrícula" do
    @aluno.matricula = nil
    assert_not @aluno.valid?
  end

  test "não deve salvar matrícula negativa" do
    @aluno.matricula = -1
    assert_not @aluno.valid?
    assert_equal "deve ser maior que 0", @aluno.errors[:matricula].first
  end

  test "não deve permitir matrícula duplicada" do
    aluno_duplicado = @aluno.dup
    @aluno.save
    assert_not aluno_duplicado.valid?
    assert_equal "já está em uso", aluno_duplicado.errors[:matricula].first
  end

  # Testes para Idade
  test "não deve salvar idade negativa" do
    @aluno.idade = -1
    assert_not @aluno.valid?
    assert_equal "deve estar entre 0 e 120", @aluno.errors[:idade].first
  end

  test "não deve salvar idade maior que 120" do
    @aluno.idade = 121
    assert_not @aluno.valid?
    assert_equal "deve estar entre 0 e 120", @aluno.errors[:idade].first
  end

  # Testes para Data de Nascimento
  test "não deve salvar sem data de nascimento" do
    @aluno.data_nascimento = nil
    assert_not @aluno.valid?
  end

  test "não deve salvar data de nascimento futura" do
    @aluno.data_nascimento = Date.tomorrow
    assert_not @aluno.valid?
    assert_equal "não pode estar no futuro", @aluno.errors[:data_nascimento].first
  end

  test "deve salvar data de nascimento válida" do
    @aluno.data_nascimento = Date.new(2000, 1, 1)
    assert @aluno.valid?
  end
end