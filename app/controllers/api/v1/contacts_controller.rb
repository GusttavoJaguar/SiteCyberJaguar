# app/controllers/api/v1/contacts_controller.rb
module Api
  module V1
   class Api::V1::ContactsController < ApplicationController
      skip_before_action :verify_authenticity_token
      
      def create
        begin
          contact = params[:contact]
          
          # Salva em arquivo CSV
          save_to_csv(contact)
          
          render json: {
            success: true,
            message: '✅ Mensagem recebida! Entrarei em contato.'
          }
          
        rescue => e
          puts "Erro (ignorado): #{e.message}"
          render json: { success: true, message: 'Recebido!' }
        end
      end
      
      private
      
      def save_to_csv(contact)
        csv_file = "/tmp/contatos.csv"
        
        # Cabeçalhos do CSV
        headers = %w[data_hora nome email assunto servico mensagem]
        
        # Se arquivo não existe, cria com cabeçalho
        if !File.exist?(csv_file)
          File.write(csv_file, headers.join(',') + "\n")
        end
        
        # Adiciona nova linha
        csv_line = [
          Time.now.strftime("%Y-%m-%d %H:%M:%S"),
          contact[:name].to_s.gsub(',', ''),
          contact[:email],
          contact[:subject].to_s.gsub(',', ''),
          contact[:service_type].to_s.gsub(',', ''),
          contact[:message].to_s.gsub(',', '').gsub("\n", ' ')
        ]
        
        File.open(csv_file, "a") do |f|
          f.puts(csv_line.join(','))
        end
        
        puts "📋 Contato salvo em CSV: #{csv_file}"
      end
    end
  end
end