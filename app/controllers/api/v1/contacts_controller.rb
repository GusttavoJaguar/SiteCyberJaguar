# app/controllers/api/v1/contacts_controller.rb
module Api
  module V1
    class ContactsController < ApplicationController
      skip_before_action :verify_authenticity_token
      
      def create
        begin
          Rails.logger.info "📧 Recebendo solicitação de orçamento"
          
          # Pega os dados
          contact_data = params.require(:contact).permit(:name, :email, :subject, :service_type, :message).to_h
          
          # Validação básica
          if contact_data[:name].blank? || contact_data[:email].blank? || contact_data[:message].blank?
            return render json: { 
              success: false, 
              error: "Nome, email e mensagem são obrigatórios" 
            }, status: :unprocessable_entity
          end
          
          # Envia email DIRETO
          ContactMailer.contact_email(contact_data).deliver_now!
          
          # Log de sucesso
          Rails.logger.info "✅ Email enviado para: #{contact_data[:email]}"
          
          # Retorna sucesso
          render json: { 
            success: true, 
            message: '✅ Orçamento solicitado com sucesso! Em breve entraremos em contato.',
            received_data: {
              name: contact_data[:name],
              email: contact_data[:email],
              subject: contact_data[:subject],
              service_type: contact_data[:service_type]
            }
          }, status: :created
          
        rescue ActionController::ParameterMissing
          render json: { 
            success: false, 
            error: "Parâmetros incorretos. Use: {contact: {name: ..., email: ..., ...}}" 
          }, status: :bad_request
          
        rescue => e
          Rails.logger.error "❌ Erro: #{e.message}"
          render json: { 
            success: false, 
            error: "Erro ao processar solicitação: #{e.message}" 
          }, status: :internal_server_error
        end
      end
    end
  end
end