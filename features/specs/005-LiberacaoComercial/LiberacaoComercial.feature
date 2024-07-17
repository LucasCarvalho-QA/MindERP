#language: pt

@cenarios-de-liberacao-comercial
Funcionalidade: Liberação de Comercial

@executar-liberacao-comercial-sucesso
Cenário: [Pedidos][Liberação Comercial] Executar Liberação Comercial de um Pedido de Vendas Aprovado - DEVE ser possível
	Dado que exista um Pedido de Venda aprovado
    E que o usuário esteja autenticado como Usuário Administrador
    E esteja na tela de Liberacao Comercial
    E o campo Situação do Pedido de Vendas deve ser "Pendente" para Liberacao Comercial
    E o campo Sit. Comercial do Pedido de Vendas deve ser "Aprovado" para Liberacao Comercial
    Quando executar a Liberacao Comercial de Pedido de Venda da listagem
    E o item deve ser removido da listagem
    