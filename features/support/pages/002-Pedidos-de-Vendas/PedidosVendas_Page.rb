class PedidosVendas_Page < SitePrism::Page

  def acessar_menu_Pedidos_de_Vendas    
    sleep 1    
    visit 'https://minderp.com.br/pedidos/pedidovendas'
  end  
  
  def iniciar_fluxo_de_cadastro
    find(:xpath, '/html/body/div[15]/div[5]/main/div/div/div[2]/a').click
  end

  def inserir_valor_campo_TipoPedido(tipo_de_pedido)     
    find(:xpath, '//*[@id="w0"]/div[3]/div/span').click
    find(:xpath, '/html/body/span/span/span[1]/input').send_keys(tipo_de_pedido)
    sleep 1
    find(:xpath, '/html/body/span/span/span[1]/input').send_keys(:enter)    
  end

  def inserir_valor_campo_Cliente(cliente)     
    find(:xpath, '//*[@id="w0"]/div[4]/div/span/span[1]/span').click
    find(:xpath, '/html/body/span/span/span[1]/input').send_keys(cliente)    
    find(:xpath, '/html/body/span/span/span[1]/input').send_keys(:enter)   
    sleep 1
    find(:xpath, '/html/body/span/span/span[1]/input').send_keys(:enter)     
  end

  def inserir_valor_campo_Vendedor(vendedor)     
    find(:xpath, '//*[@id="w0"]/div[7]/div/span/span[1]/span').click
    find(:xpath, '/html/body/span/span/span[1]/input').send_keys(vendedor)
    sleep 1
    find(:xpath, '/html/body/span/span/span[1]/input').send_keys(:enter)    
  end

  def pressionar_botao_salvar_pedido    
    find(:xpath, '//*[@id="w0"]/div[31]/button').click
  end

  def validar_conteudo_na_pagina(content)
    page.has_content?(content)
  end

  def cadastrar_pedido_de_vendas    
    acessar_menu_Pedidos_de_Vendas()
    iniciar_fluxo_de_cadastro()
    inserir_valor_campo_TipoPedido("Venda de Produção Própria - TITANN TREINAMENTO")
    inserir_valor_campo_Cliente("45.989.998/0001-37")
    inserir_valor_campo_Vendedor("AUDITESTE - AUDITESTE")
    pressionar_botao_salvar_pedido()
    validar_conteudo_na_pagina("Produtos do Pedido de Vendas")
  end
end