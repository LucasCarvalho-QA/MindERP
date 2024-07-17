class LiberacaoComercial_Page < SitePrism::Page

  def acessar_tela_Liberacao_Comercial
    sleep 1    
    visit 'https://minderp.com.br/pedidos/liberacaocomercial'
  end

  def executar_liberacao_comercial    
    find(:xpath, '//*[@id="w1-container"]/table/tbody[1]/tr[1]/td[2]/div/div[1]/span').click
    scroll_ate_fim_da_pagina()
    find(:xpath, '//*[@id="w5"]/div[31]/a[1]').click  
    find(:xpath, '//*[@id="w0"]/div[9]/button').click  
    sleep 3
  end

  def retornar_quantidade_de_pedidos_na_listagem
    find(:xpath, '//*[@id="w1"]/div[1]/b[2]').text.to_i     
  end

  def validar_remocao_de_item_em_listagem(quantidade_esperada)
    quantidade_encontrada = find(:xpath, '//*[@id="w1"]/div[1]/b[2]').text.to_i    
    expect(quantidade_esperada).to eq(quantidade_encontrada)
  end


  def validar_situacao_pedido(situacao_esperada)
    situacao_encontrada = find(:xpath, '//*[@id="w1-container"]/table/tbody[1]/tr[1]/td[12]/span').text    
    expect(situacao_encontrada).to eq(situacao_esperada)
  end

  def validar_situacao_comercial_pedido(situacao_comercial_esperada)
    situacao_comercial_encontrada = find(:xpath, '//*[@id="w1-container"]/table/tbody[1]/tr[1]/td[14]').text    
    expect(situacao_comercial_encontrada).to eq(situacao_comercial_esperada-1)
  end

  def scroll_ate_fim_da_pagina
    execute_script('window.scrollTo(0, document.body.scrollHeight);')
  end
end