Dado('que exista um Pedido de Venda pendente de aprovação') do  
  #001-Login
  @Login_Page.load
  @Login_Page.inserir_credenciais_validas    
  
  #002-Pedidos-Vendas
  @PedidosVendas_Page.cadastrar_pedido_de_vendas

  #003-Produtos-Pedidos-Vendas
  @ProdutosPedidosVendas_Page.inserir_valor_campo_Produto("COXIM")
  @ProdutosPedidosVendas_Page.inserir_valor_campo_Quantidade("1")    
  @ProdutosPedidosVendas_Page.inserir_valor_campo_PrecoUnitario("5000")
  @ProdutosPedidosVendas_Page.pressionar_botao_salvar_produtoPedidoVendas
  @ProdutosPedidosVendas_Page.inserir_valor_campo_Produto("100.0001")
  @ProdutosPedidosVendas_Page.inserir_valor_campo_Quantidade("1")
  @ProdutosPedidosVendas_Page.inserir_valor_campo_PrecoUnitario("5000")
  @ProdutosPedidosVendas_Page.pressionar_botao_salvar_produtoPedidoVendas
  @ProdutosPedidosVendas_Page.validar_itens_adicionados("2")
end

E('que o usuário esteja autenticado como Usuário Administrador') do
  @Login_Page.load
  @Login_Page.inserir_credenciais_validas  
end

E('esteja na tela de Pedidos de Vendas') do
  @ConfirmarPedido_Page.acessar_tela_Pedidos_de_Vendas
end

Quando('clicar em Aprovar Pedido em um item da listagem') do  
  @ConfirmarPedido_Page.aprovar_pedido  
end

Então('o campo Situação do Pedido de Vendas deve ser {string}') do |situacao_esperada|
  @ConfirmarPedido_Page.validar_situacao_pedido(situacao_esperada)
end

E('o campo Sit. Comercial do Pedido de Vendas deve ser {string}') do |situacao_comercial_esperada|
  @ConfirmarPedido_Page.validar_situacao_comercial_pedido(situacao_comercial_esperada)
end
