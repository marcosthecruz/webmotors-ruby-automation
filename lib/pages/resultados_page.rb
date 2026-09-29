class ResultadosPage
  def initialize(sessao)
    @sessao = sessao
  end

  def visivel?
    Selenium::WebDriver::Wait.new(timeout: 20).until do
      @sessao.find_element(:accessibility_id, 'Pesquisa').displayed?
    end
  end

 def modelo_exibido?(modelo)
  nome = modelo.strip.upcase

  Selenium::WebDriver::Wait.new(timeout: 20).until do
    begin
      @sessao.find_element(
        :xpath,
        "//*[@resource-id='modelo_veiculo_rb_txt' and contains(@content-desc, '#{nome}')]"
      ).displayed?
    rescue Selenium::WebDriver::Error::NoSuchElementError,
           Selenium::WebDriver::Error::StaleElementReferenceError
      false
    end
  end
 end
  
end