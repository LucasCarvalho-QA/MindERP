class ConfirmarPedido_Page < SitePrism::Page

  def acessar_tela_Pedidos_de_Vendas
    sleep 1    
    visit 'https://minderp.com.br/pedidos/pedidovendas'
  end

  def retornar_quantidade_de_pedidos_na_listagem
    elemento = find(:xpath, '//*[@id="w5"]/div[1]/b[2]')    
    elemento.text.to_i
  end

  def aprovar_pedido
    find(:xpath, '//*[@id="w5-container"]/table/tbody[1]/tr[1]/td[19]/a').click    
    sleep 4    
  end

  def validar_situacao_pedido(situacao_esperada)
    situacao_encontrada = find(:xpath, '//*[@id="w5-container"]/table/tbody[1]/tr[1]/td[11]').text    
    expect(situacao_encontrada).to eq(situacao_esperada)
  end

  def validar_situacao_comercial_pedido(situacao_comercial_esperada)
    situacao_comercial_encontrada = find(:xpath, '//*[@id="w5-container"]/table/tbody[1]/tr[1]/td[13]').text    
    expect(situacao_comercial_encontrada).to eq(situacao_comercial_esperada)
  end
end