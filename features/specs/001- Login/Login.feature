#language: pt

@cenarios-de-login
Funcionalidade: Login

@login
Cenário: Realizar o login no MindERP com credenciais válidas
	Dado que o usuário esteja na página de autenticação do MindERP
	Quando inserir as credenciais válidas    
	Então o usuário é redirecionado para a página inicial do MindERP