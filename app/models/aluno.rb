class Aluno < ApplicationRecord
  validates :nome, 
    presence: { message: "não pode ficar em branco" }, 
    length: { maximum: 100, message: "é muito longo (máximo: 100 caracteres)" }
  
  validates :matricula, 
    presence: true, 
    numericality: { greater_than: 0, message: "deve ser maior que 0" }, 
    uniqueness: { message: "já está em uso" }
  
  validates :idade, 
    presence: true,   
    numericality: { 
      only_integer: true,
      greater_than_or_equal_to: 0, 
      less_than_or_equal_to: 120,
      message: "deve estar entre 0 e 120"
    }
  
  validates :data_nascimento, presence: true
  validate :data_nascimento_nao_pode_ser_futura

  private

  def data_nascimento_nao_pode_ser_futura
    if data_nascimento.present? && data_nascimento > Date.today
      errors.add(:data_nascimento, "não pode estar no futuro")
    end
  end
end
