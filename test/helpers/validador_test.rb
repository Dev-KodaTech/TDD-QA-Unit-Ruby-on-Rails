require "test_helper"

class ValidadorTest < ActiveSupport::TestCase
  test "deve rejeitar CPF nulo" do
    # Arrange
    cpf = nil

    # Act
    resultado = Validador.validar_cpf(cpf)

    # Assert
    assert_not resultado
  end

  test "deve rejeitar CPF vazio" do
    # Arrange
    cpf = ""

    # Act
    resultado = Validador.validar_cpf(cpf)

    # Assert
    assert_not resultado
  end

  test "deve rejeitar CPF com menos de 11 dígitos" do
    # Arrange
    cpf = "1234567890"

    # Act
    resultado = Validador.validar_cpf(cpf)

    # Assert
    assert_not resultado
  end

  test "deve rejeitar CPF com mais de 11 dígitos" do
    # Arrange
    cpf = "123456789012"

    # Act
    resultado = Validador.validar_cpf(cpf)

    # Assert
    assert_not resultado
  end

  test "deve rejeitar CPF com todos os dígitos iguais" do
    # Arrange
    cpfs_invalidos = ["11111111111", "22222222222", "33333333333"]

    # Act & Assert
    cpfs_invalidos.each do |cpf|
      resultado = Validador.validar_cpf(cpf)
      assert_not resultado, "CPF #{cpf} deveria ser rejeitado"
    end
  end

  test "deve aceitar CPF válido sem formatação" do
    # Arrange
    cpf = "52998224725"

    # Act
    resultado = Validador.validar_cpf(cpf)

    # Assert
    assert resultado
  end

  test "deve aceitar CPF válido com formatação" do
    # Arrange
    cpf = "529.982.247-25"

    # Act
    resultado = Validador.validar_cpf(cpf)

    # Assert
    assert resultado
  end

  test "deve rejeitar CPF inválido com primeiro dígito verificador incorreto" do
    # Arrange
    cpf = "52998224735"

    # Act
    resultado = Validador.validar_cpf(cpf)

    # Assert
    assert_not resultado
  end

  test "deve rejeitar CPF inválido com segundo dígito verificador incorreto" do
    # Arrange
    cpf = "52998224724"

    # Act
    resultado = Validador.validar_cpf(cpf)

    # Assert
    assert_not resultado
  end

  test "deve rejeitar CPF com caracteres não numéricos" do
    # Arrange
    cpf = "529.982.247-2A"

    # Act
    resultado = Validador.validar_cpf(cpf)

    # Assert
    assert_not resultado
  end
end