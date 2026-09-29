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

Inicie o emulador Android com o Webmotors instalado e o servidor Appium antes dos testes mobile.

```powershell
bundle install
$env:CUCUMBER_OUTPUT_ENCODING = "UTF-8"
bundle exec cucumber --publish-quiet
bundle exec rspec
```

A variável de codificação deve ser definida novamente em cada terminal PowerShell novo.