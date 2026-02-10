require 'net/smtp'

begin
  smtp = Net::SMTP.new('smtp.gmail.com', 587)
  smtp.enable_starttls
  
  smtp.start('gmail.com', 'gusttavojaguar@gmail.com', 'zqnupoljyryqjsax', :plain) do |smtp|
    puts "✅ Conexão OK!"
    
    msg = "From: gusttavojaguar@gmail.com\nTo: gusttavojaguar@gmail.com\nSubject: Teste Rails\n\nFuncionou!"
    smtp.send_message(msg, 'gusttavojaguar@gmail.com', 'gusttavojaguar@gmail.com')
    puts "📤 Email enviado!"
  end
rescue => e
  puts "❌ Falha: #{e.message}"
end
