#language: pt

@cenarios-de-produtos-pedidos-de-vendas
Funcionalidade: Pedidos de Vendas

@cadastrar-produtos-pedidos-de-vendas
Cenário: [Pedidos][Produtos do Pedido de Vendas] Cadastrar produtos ao pedido de vendas com dados válidos - DEVE retornar sucesso
	Dado que o usuário tenha um Pedido de Venda cadastrado
    
    E insira "COXIM" no campo Produto
    E insira "1" no campo Quantidade    
    E inclua esse item ao Pedido de Venda

    E insira "100.0001" no campo Produto
    E insira "1" no campo Quantidade
    E insira "5000" no campo Preço Unitário
    E inclua esse item ao Pedido de Venda    
    
    Então produtos serão adicionados "2" Produtos ao Pedido de Vendas com sucesso