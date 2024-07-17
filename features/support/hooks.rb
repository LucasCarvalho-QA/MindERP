# Before sem uma tag executa antes de todos os cenários
Before do
    @Login_Page = Login_Page.new
    @PedidosVendas_Page = PedidosVendas_Page.new
    @ProdutosPedidosVendas_Page = ProdutosPedidosVendas_Page.new
    @ConfirmarPedido_Page = ConfirmarPedido_Page.new
end

# Before com tag executa antes do cenário que estiver com esta tag comentada
Before('@exemplo') do
end

# After sem uma tag executa depois de todos os cenários
After do
end

Before do |scenario|
  # armazena o nome do cenario
  @scenario_name = scenario.name
  HtmlLogger.salvar_nome_cenario(@scenario_name)
end

at_exit do
  HtmlLogger.fechar_arquivo
end

# Anexar os prints ao relatório
After do |scenario|
     sleep 1
     nome_cenario = scenario.name.tr(' ', '_').downcase!
     nome_cenario = nome_cenario.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/,'')
     screenshot = "features/logs/shots/#{nome_cenario}.png"
     page.save_screenshot(screenshot)
     attach(screenshot, 'image/png')
end

 at_exit do
   features_folder = File.expand_path('../..', __FILE__)
   current_time = Time.now.strftime('%d-%m-%Y_%H-%M')
   original_path = File.join(features_folder, 'logs', 'report.html')

  unless ENV['TF_BUILD'] #verifica se nao esta executando no pipelines
    new_path = File.join(features_folder, 'logs', "report_#{current_time}.html")
    File.rename(original_path, new_path) if File.exist?(original_path)
   end
end

at_exit do
  time = Time.now.getutc
  ReportBuilder.configure do |config|
  config.json_path = 'features/logs/report.json'
  config.report_path = 'features/logs/ReportAutomacaoIUL'
  config.report_types = [:json, :html]
  config.report_tabs = %w[Overview Features Scenarios Errors]
  config.report_title = 'Interface Única de Liberação - Painel'
  config.compress_images = true
  config.additional_info = { 'Project name' => 'IUL Painel', 'Platform' => 'Windows', 'Report generated' => time }
  config.color = 'blue'
  #'cyan green'
end
end
