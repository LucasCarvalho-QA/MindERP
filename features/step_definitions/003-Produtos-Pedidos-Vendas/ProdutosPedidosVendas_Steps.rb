Dado('que o usuário tenha um Pedido de Venda cadastrado') do
  @Login_Page.load
  @Login_Page.inserir_credenciais_validas  
  
  @PedidosVendas_Page.cadastrar_pedido_de_vendas
end

E('insira {string} no campo Produto') do |produto|
  @ProdutosPedidosVendas_Page.inserir_valor_campo_Produto(produto)
end

E('insira {string} no campo Quantidade') do |quantidade|
  @ProdutosPedidosVendas_Page.inserir_valor_campo_Quantidade(quantidade)
end

E('insira {string} no campo Preço Unitário') do |preco_unitario|
  @ProdutosPedidosVendas_Page.inserir_valor_campo_PrecoUnitario(preco_unitario)
end

E('inclua esse item ao Pedido de Venda') do
  @ProdutosPedidosVendas_Page.pressionar_botao_salvar_produtoPedidoVendas
end

Então('produtos serão adicionados ao Pedido de Vendas com sucesso') do  
  @ProdutosPedidosVendas_Page.validar_itens_adicionados
end