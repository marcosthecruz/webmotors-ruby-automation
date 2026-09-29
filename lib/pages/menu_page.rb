class MenuPage
  def initialize(sessao)
    @sessao = sessao
  end

  def abrir
  inicio = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  botao_menu = Selenium::WebDriver::Wait.new(timeout: 40).until do
    @sessao.find_elements(
      :id,
      'hands.android.webmotors:id/navigation_menu_item'
    ).find(&:displayed?)
  end
    puts "Espera pelo Menu: #{(Process.clock_gettime(Process::CLOCK_MONOTONIC) - inicio).round(1)}s"
    botao_menu.click
  end
  def visivel?
    @sessao.find_element(:accessibility_id, 'Meus anúncios').displayed?
  end
  def ir_para_comprar
    @sessao.find_element(:accessibility_id, 'Quero comprar').click
  end
end