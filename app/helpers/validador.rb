class Validador
  def self.validar_cpf(cpf)
    # Verifica se é nulo ou vazio
    return false if cpf.nil? || cpf.empty?

    # Remove caracteres especiais
    cpf = cpf.gsub(/[^0-9]/, '')

    # Verifica se tem 11 dígitos
    return false if cpf.length != 11

    # Verifica se todos os dígitos são iguais
    return false if cpf.chars.uniq.length == 1

    # Calcula primeiro dígito verificador
    soma = 0
    9.times do |i|
      soma += cpf[i].to_i * (10 - i)
    end
    primeiro_digito = 11 - (soma % 11)
    primeiro_digito = 0 if primeiro_digito > 9

    # Verifica primeiro dígito
    return false if cpf[9].to_i != primeiro_digito

    # Calcula segundo dígito verificador
    soma = 0
    10.times do |i|
      soma += cpf[i].to_i * (11 - i)
    end
    segundo_digito = 11 - (soma % 11)
    segundo_digito = 0 if segundo_digito > 9

    # Verifica segundo dígito
    cpf[10].to_i == segundo_digito
  end
end