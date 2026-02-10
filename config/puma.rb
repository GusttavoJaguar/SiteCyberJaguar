# config/puma.rb - VERSÃO CORRIGIDA E LIMPA
# Número de workers (processos)
workers Integer(ENV['WEB_CONCURRENCY'] || 1)

# Número de threads por worker
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

# Pré-carrega a aplicação para boot mais rápido
preload_app!

# Porta
port ENV['PORT'] || 3000

# Ambiente
environment ENV['RAILS_ENV'] || 'development'

# PID file (apenas se especificado)
pidfile ENV['PIDFILE'] if ENV['PIDFILE']

# Plugin para restart por rails restart
plugin :tmp_restart

# Configuração específica para pré-carregamento
before_fork do
  ActiveRecord::Base.connection_pool.disconnect! if defined?(ActiveRecord)
end

on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end