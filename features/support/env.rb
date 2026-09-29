require_relative '../../lib/appium_session'
require 'allure-cucumber'
require 'tempfile'

Before('@mobile') do
  @sessao = AppiumSession.iniciar
end

After('@mobile') do |cenario|
  begin
    if @sessao
      Tempfile.create(['webmotors-', '.png']) do |arquivo|
        arquivo.binmode
        arquivo.write(@sessao.screenshot_as(:png))
        arquivo.flush

        File.open(arquivo.path, 'rb') do |imagem|
          Allure.add_attachment(
            name: cenario.failed? ? 'Tela no momento da falha' : 'Tela final da busca',
            source: imagem,
            type: Allure::ContentType::PNG,
            test_case: true
          )
        end
      end
    end
  rescue Selenium::WebDriver::Error::WebDriverError => erro
    warn "Não foi possível capturar a tela: #{erro.message}"
  ensure
    @sessao&.quit
  end
end