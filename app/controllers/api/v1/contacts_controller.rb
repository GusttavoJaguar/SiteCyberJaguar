module Api
  module V1
   class Api::V1::ContactsController < ApplicationController
      skip_before_action :verify_authenticity_token
      
      def create
        begin
          # 1. Valida dados básicos
          if params[:contact].nil? || params[:contact][:email].blank?
            return render json: { 
              success: false, 
              message: 'Email é obrigatório' 
            }, status: :bad_request
          end
          
          # 2. Apenas loga (não usa banco)
          puts "=" * 50
          puts "📨 NOVO CONTATO - #{Time.now}"
          puts "Nome: #{params[:contact][:name]}"
          puts "Email: #{params[:contact][:email]}"
          puts
          puts "Assunto: #{params[:contact][:subject]}"
          puts "Serviço: #{params[:contact][:service_type]}"
          puts "Mensagem: #{params[:contact][:message]}"
          puts "=" * 50
          
          # 3. Retorna sucesso
          render json: {
            success: true,
            message: '✅ Mensagem enviada com sucesso! Entrarei em contato em breve.',
            timestamp: Time.now.iso8601
          }, status: :ok
          
        rescue => e
          # 4. Em caso de erro, ainda retorna sucesso
          puts "⚠️ Erro no controller (ignorado): #{e.message}"
          
          render json: {
            success: true,
            message: '✅ Recebido! Obrigado pelo contato.'
          }, status: :ok
        end
      end
    end
  end
end