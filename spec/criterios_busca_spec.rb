require_relative '../lib/criterios_busca'

RSpec.describe CriteriosBusca do
  it 'remove espaços no início e no fim do termo' do
    busca = described_class.new(termo: '  Honda Civic  ')

    expect(busca.termo).to eq('Honda Civic')
  end

  it 'considera inválido um termo só com espaços' do
    busca = described_class.new(termo: '   ')

    expect(busca).not_to be_valido
  end

  it 'considera válido um termo preenchido' do
  busca = described_class.new(termo: 'Honda Civic')

  expect(busca).to be_valido
  end

  it 'rejeita preço máximo igual a zero' do
  busca = described_class.new(termo: 'Honda Civic', preco_maximo: 0)

  expect(busca).not_to be_valido
  end
end