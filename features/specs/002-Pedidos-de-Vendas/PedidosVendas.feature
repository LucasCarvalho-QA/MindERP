#language: pt

@cenarios-de-pedidos-de-vendas
Funcionalidade: Pedidos de Vendas

@cadastrar-pedidos-de-vendas
Cenário: [Pedidos][Pedidos de Vendas] Cadastrar pedido de vendas com dados válidos - DEVE retornar sucesso
	Dado que o usuário esteja autenticado no Portal MindERP
	E inicia o fluxo Pedidos > Pedidos de Vendas
	E inicia um novo cadastro de Pedido de Vendas 
	E insira "Venda de Produção Própria - TITANN TREINAMENTO" no campo Tipo de Pedido
	E insira "45.989.998/0001-37" no campo Cliente
	E insira "AUDITESTE - AUDITESTE" no campo Vendedor
	Quando finaliza o cadastro de Pedido de Vendas
	Então DEVE ser redirecionado para página "Produtos do Pedido de Vendas"