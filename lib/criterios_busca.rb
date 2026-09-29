class CriteriosBusca
  attr_reader :termo, :preco_maximo

  def initialize(termo:, preco_maximo: nil)
    @termo = termo.strip
    @preco_maximo = preco_maximo
  end

  def valido?
    return false if termo.empty?
    return false if preco_maximo && preco_maximo <= 0

    true
  end
end