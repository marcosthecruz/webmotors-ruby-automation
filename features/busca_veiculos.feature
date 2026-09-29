# language: pt
Funcionalidade: Critérios de busca de veículos

  Cenário: Aceitar uma busca por modelo
    Dado que informei o modelo "Honda Civic"
    Quando valido os critérios da busca
    Então a busca deve ser válida

  Cenário: Rejeitar uma busca com modelo vazio
    Dado que informei o modelo "   "
    Quando valido os critérios da busca
    Então a busca deve ser inválida
