Dado('que exista um Pedido de Venda aprovado') do
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

  #004-Confirmar-Pedido
  @Login_Page.load
  @Login_Page.inserir_credenciais_validas  
  @ConfirmarPedido_Page.acessar_tela_Pedidos_de_Vendas
  @ConfirmarPedido_Page.validar_situacao_pedido("Em Preparação")
  @ConfirmarPedido_Page.aprovar_pedido  
  @ConfirmarPedido_Page.validar_situacao_pedido("Aberto")
  @ConfirmarPedido_Page.validar_situacao_comercial_pedido("Aprovado")
end

E('esteja na tela de Liberacao Comercial') do  
  @LiberacaoComercial_Page.acessar_tela_Liberacao_Comercial
  @quantidade_pedido_de_vendas = @LiberacaoComercial_Page.retornar_quantidade_de_pedidos_na_listagem
end

E('o campo Situação do Pedido de Vendas deve ser {string} para Liberacao Comercial') do |situacao_esperada|
  @LiberacaoComercial_Page.validar_situacao_pedido(situacao_esperada)
end

E('o campo Sit. Comercial do Pedido de Vendas deve ser {string} para Liberacao Comercial') do |situacao_comercial_esperada|
  @LiberacaoComercial_Page.validar_situacao_comercial_pedido(situacao_comercial_esperada)
end

Quando('executar a Liberacao Comercial de Pedido de Venda da listagem') do
  @LiberacaoComercial_Page.executar_liberacao_comercial
end

E('o item deve ser removido da listagem') do
  @LiberacaoComercial_Page.validar_remocao_de_item_em_listagem(@quantidade_pedido_de_vendas)
end