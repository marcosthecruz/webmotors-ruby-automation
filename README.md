# Webmotors Ruby Automation

Projeto de estudos de automação de testes Android para o app Webmotors.

## Tecnologias

Ruby, RSpec, Cucumber/Gherkin, Appium, UiAutomator2 e Allure.

## Cobertura

- Validação dos critérios de busca por modelo preenchido ou vazio.
- Busca mobile por Honda Civic e validação de anúncio nos resultados.

## Estrutura

- `features/`: cenários Gherkin e definições dos passos.
- `lib/pages/`: Page Objects das telas.
- `lib/appium_session.rb`: configuração da sessão Appium.
- `spec/`: testes RSpec.

## Execução

Requer emulador Android com o app Webmotors instalado e servidor Appium em execução.

```powershell
bundle install
$env:CUCUMBER_OUTPUT_ENCODING = "UTF-8"
bundle exec cucumber --publish-quiet
bundle exec rspec