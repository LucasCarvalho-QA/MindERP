Dado('que o usuário esteja autenticado no Portal MindERP') do
    @Login_Page.load
    @Login_Page.inserir_credenciais_validas
    @Login_Page.validar_conteudo_na_pagina("AUDITESTE")
end

E('inicia o fluxo Pedidos > Pedidos de Vendas') do
    @PedidosVendas_Page.acessar_menu_Pedidos_de_Vendas
end

E('inicia um novo cadastro de Pedido de Vendas') do
    @PedidosVendas_Page.iniciar_fluxo_de_cadastro
end

E('insira {string} no campo Tipo de Pedido') do |tipo_de_pedido|
    @PedidosVendas_Page.inserir_valor_campo_TipoPedido(tipo_de_pedido) 
end

E('insira {string} no campo Cliente') do |cliente|
    @PedidosVendas_Page.inserir_valor_campo_Cliente(cliente) 
end

E('insira {string} no campo Vendedor') do |vendedor|
    @PedidosVendas_Page.inserir_valor_campo_Vendedor(vendedor) 
end

Quando('finaliza o cadastro de Pedido de Vendas') do
    @PedidosVendas_Page.pressionar_botao_salvar_pedido
end

Então('DEVE ser redirecionado para página {string}') do |titulo_da_pagina|
    @PedidosVendas_Page.validar_conteudo_na_pagina(titulo_da_pagina) 
end