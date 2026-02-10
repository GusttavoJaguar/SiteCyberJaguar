env_file = Rails.root.join('.env')

if File.exist?(env_file)
  File.readlines(env_file).each do |line|
    next if line.strip.empty? || line.start_with?('#')
    
    key, value = line.strip.split('=', 2)
    ENV[key] = value.to_s.strip
  end
  puts "✅ Arquivo .env carregado manualmente"
else
  puts "⚠️  Arquivo .env não encontrado em #{env_file}"
end