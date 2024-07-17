class ProdutosPedidosVendas_Page < SitePrism::Page

  def inserir_valor_campo_Produto(produto)         
    find(:xpath, '//*[@id="select2-prodpedidovendas-produto_id-container"]').click        
    find(:xpath, '/html/body/span[15]/span/span[1]/input').send_keys(produto)    
    sleep 1
    find(:xpath, '/html/body/span[15]/span/span[1]/input').send_keys(:enter)        
  end
  
  def inserir_valor_campo_Quantidade(quantidade)     
    find(:xpath, '//*[@id="prodpedidovendas-quantidade"]').click
    find(:xpath, '//*[@id="prodpedidovendas-quantidade"]').send_keys(quantidade)    
  end

  def inserir_valor_campo_PrecoUnitario(preco_unitario)     
    find(:xpath, '//*[@id="prodpedidovendas-precounitario-disp"]').click
    find(:xpath, '//*[@id="prodpedidovendas-precounitario-disp"]').send_keys(preco_unitario)    
  end

  def pressionar_botao_salvar_produtoPedidoVendas    
    find(:xpath, '//*[@id="frm-item-pedido"]/div[12]/button[1]').click
    sleep 3
  end

  def validar_conteudo_na_pagina(content)
    page.has_content?(content)
  end  
  
  def validar_itens_adicionados(quantidade_produto)
    elemento = find(:xpath, '//*[@id="w5"]/div[1]/b')
    elemento.text.include?(quantidade_produto)
  end

end