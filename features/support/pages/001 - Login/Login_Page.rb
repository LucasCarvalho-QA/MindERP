class Login_Page < SitePrism::Page
   
     set_url ENVIRONMENT['server']     
 
    def initialize
       @usuario = AUTH['login']
    end

    def inserir_credenciais_validas
      find(:xpath, '//*[@id="w0"]/div[1]/div[1]/div[2]/input').send_keys(@usuario['email'])
      find(:xpath, '//*[@id="js-input-password"]').send_keys(@usuario['senha'])
      find(:xpath, '//*[@id="w0"]/div[2]/button').click
    end

    def inserir_credenciais_validas_administrador
      find(:xpath, '//*[@id="w0"]/div[1]/div[1]/div[2]/input').send_keys('usuario2@auditeste.com.br')
      find(:xpath, '//*[@id="js-input-password"]').send_keys(@usuario['senha'])
      find(:xpath, '//*[@id="w0"]/div[2]/button').click
    end
  
    def validar_conteudo_na_pagina(content)
      page.has_content?(content)
    end
    
  end