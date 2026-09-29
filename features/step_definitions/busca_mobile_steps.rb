require_relative '../../lib/pages/menu_page'
require_relative '../../lib/pages/busca_page'
require_relative '../../lib/pages/resultados_page'

Dado('que abri o app Webmotors') do
  @sessao.execute_script(
    'mobile: activateApp',
    { appId: 'hands.android.webmotors' }
  )

  Selenium::WebDriver::Wait.new(timeout: 20).until do
    @sessao.execute_script('mobile: getCurrentPackage') ==
      'hands.android.webmotors'
  end
end

Quando('busco anúncios do modelo {string}') do |modelo|
  menu = MenuPage.new(@sessao)
  menu.abrir

  Selenium::WebDriver::Wait.new(timeout: 20).until do
    menu.visivel?
  end

  menu.ir_para_comprar

  busca = BuscaPage.new(@sessao)
  Selenium::WebDriver::Wait.new(timeout: 10).until do
    busca.visivel?
  end

  busca.informar_modelo(modelo)
  busca.selecionar_modelo(modelo)
  busca.ver_anuncios
end

Então('devo ver um anúncio do modelo {string}') do |modelo|
  resultados = ResultadosPage.new(@sessao)

  raise 'A tela de resultados não abriu' unless resultados.visivel?
  raise "Nenhum anúncio de #{modelo} foi exibido" unless resultados.modelo_exibido?(modelo)
end