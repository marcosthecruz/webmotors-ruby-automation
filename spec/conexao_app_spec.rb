require_relative '../lib/appium_session'
require_relative '../lib/pages/menu_page'
require_relative '../lib/pages/busca_page'
require_relative '../lib/pages/resultados_page'
require 'rspec/retry'

  RSpec.describe 'Conexão com o app Webmotors' do
    it 'inicia uma sessão no aparelho Android',
      retry: 2,
      exceptions_to_retry: [
        Selenium::WebDriver::Error::TimeoutError,
        Selenium::WebDriver::Error::StaleElementReferenceError
      ] do
      sessao = AppiumSession.iniciar

    begin
      sessao.execute_script('mobile: activateApp', { appId: 'hands.android.webmotors' })

      pacote_em_primeiro_plano = sessao.execute_script('mobile: getCurrentPackage')
      expect(pacote_em_primeiro_plano).to eq('hands.android.webmotors')

      File.write('tela_inicial.xml', sessao.page_source)

      #sessao.find_element(:id, 'hands.android.webmotors:id/navigation_menu_item').click
      menu = MenuPage.new(sessao)
      menu.abrir
      
      Selenium::WebDriver::Wait.new(timeout: 20).until do
        menu.visivel?
      end

      menu.ir_para_comprar

      busca = BuscaPage.new(sessao)
      Selenium::WebDriver::Wait.new(timeout: 10).until do
        busca.visivel?
      end

      busca.informar_modelo('Honda Civic')
      busca.selecionar_modelo('Honda Civic')
      busca.ver_anuncios

      resultados = ResultadosPage.new(sessao)
      expect(resultados.visivel?).to be true
      expect(resultados.modelo_exibido?('Honda Civic')).to be true

      File.write('resultados_apos_5s.xml', sessao.page_source)

      puts "App em primeiro plano: #{pacote_em_primeiro_plano}"
    ensure
      sessao.quit
    end
  end
end