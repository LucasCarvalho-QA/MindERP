#language: pt

@cenarios-de-confirmar-pedido
Funcionalidade: Confirmar Pedido

@cadastrar-confirmar-pedido-de-vendas-sucesso
Cenário: [Pedidos][Confirmar Pedido] Aprovar Pedido de Vendas com Usuário Administrador - DEVE ser possível
	Dado que exista um Pedido de Venda pendente de aprovação
    E que o usuário esteja autenticado como Usuário Administrador
    E esteja na tela de Pedidos de Vendas
    E o campo Situação do Pedido de Vendas deve ser "Em Preparação"
    Quando clicar em Aprovar Pedido em um item da listagem
    Então o campo Situação do Pedido de Vendas deve ser "Aberto"
    E o campo Sit. Comercial do Pedido de Vendas deve ser "Aprovado"