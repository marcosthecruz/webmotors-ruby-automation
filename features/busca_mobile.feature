# language: pt
@mobile
Funcionalidade: Busca de veículos no app Webmotors

  Cenário: Buscar anúncios de um modelo
    Dado que abri o app Webmotors
    Quando busco anúncios do modelo "Honda Civic"
    Então devo ver um anúncio do modelo "Honda Civic"