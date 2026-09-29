require_relative '../../lib/criterios_busca'
require 'rspec/expectations'

World(RSpec::Matchers)

Given('que informei o modelo {string}') do |modelo|
  @criterios = CriteriosBusca.new(termo: modelo)
end

When('valido os critérios da busca') do
  @resultado = @criterios.valido?
end

Then('a busca deve ser válida') do
  expect(@resultado).to be true
end

Then('a busca deve ser inválida') do
    expect(@resultado).to be false
end