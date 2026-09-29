class BuscaPage
  def initialize(sessao)
    @sessao = sessao
  end

  def visivel?
    @sessao.find_elements(
      :id,
      'hands.android.webmotors:id/et_search_view'
    ).any?(&:displayed?)
  rescue Selenium::WebDriver::Error::StaleElementReferenceError
    false
  end

  def informar_modelo(modelo)
    localizador = 'hands.android.webmotors:id/et_search_view'

    Selenium::WebDriver::Wait.new(timeout: 20).until do
      begin
        campo = @sessao.find_element(:id, localizador)

        if campo.attribute('text') == modelo
          true
        else
          campo.clear
          campo.send_keys(modelo)
          campo.attribute('text') == modelo
        end
      rescue Selenium::WebDriver::Error::NoSuchElementError,
             Selenium::WebDriver::Error::StaleElementReferenceError
        false
      end
    end
  end
  def selecionar_modelo(modelo)
    linha = @sessao.find_element(
      :xpath,
      "//androidx.recyclerview.widget.RecyclerView[@resource-id='hands.android.webmotors:id/lstResult']" \
      "//android.view.ViewGroup[.//android.widget.TextView[@text='#{modelo}']]"
    )

    linha.click
  end
  def ver_anuncios
    botao = Selenium::WebDriver::Wait.new(timeout: 20).until do
      @sessao.find_element(:id, 'hands.android.webmotors:id/btn_see_add')
    end

    botao.click
  end

end