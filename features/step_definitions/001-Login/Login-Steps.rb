Dado('que o usuário esteja na página de autenticação do MindERP') do             
    @Login_Page.load
end                                                                          
                                                                               
Quando('inserir as credenciais válidas') do                                  
    @Login_Page.inserir_credenciais_validas
end
                                                                                                                                              
Então('o usuário é redirecionado para a página inicial do MindERP') do           
    @Login_Page.validar_conteudo_na_pagina("AUDITESTE")
end                                                                                  