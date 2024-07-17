module HtmlLogger
  FILE_PATH = 'features/logs/log.html'

  def self.salvar_nome_cenario(nome_cenario)
    unless File.exist?(FILE_PATH)
      criar_arquivo_com_estilos
    end

    adicionar_conteudo("<div class='cenario'><strong>Cenário:</strong> <strong>#{nome_cenario}</strong></div>")
  end

  def self.criar_arquivo_com_estilos
    File.open(FILE_PATH, 'w') do |file|
      file.puts <<-HTML
<!DOCTYPE html>
<html lang="pt">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Testes automatizados</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
    }
    .cenario {
      margin-bottom: 10px;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      background-color: #f9f9f9;
    }
    .cenario strong {
      color: #333;
    }
    .dados {
      padding: 10px;
    }
  </style>
</head>
<body>
  <h1>Testes automatizados</h1>
      HTML
    end
  end

  def self.adicionar_conteudo(conteudo)
    File.open(FILE_PATH, 'a') do |file|
      file.puts conteudo
    end
  end

  def self.salvar_dados(elemento, valor)
    adicionar_conteudo("<div class='dados'><strong>Campo:</strong> #{elemento} - <strong>Dado utilizado:</strong> #{valor}</div>")
  end

  def self.salvar_nome_tela(nome)
    adicionar_conteudo("<div class='dados'><strong> #{nome} </strong> </div>")
  end

  def self.fechar_arquivo
    if File.exist?(FILE_PATH)
      File.open(FILE_PATH, 'a') do |file|
        file.puts <<-HTML
</body>
</html>
        HTML
      end
      renomear_arquivo
    end
  end

  def self.renomear_arquivo
    timestamp = Time.now.strftime('%Y-%m-%d_%H-%M-%S')
    novo_nome = "features/logs/Report_log_#{timestamp}.html"
    File.rename(FILE_PATH, novo_nome)
  end
end
