# app/controllers/api/v1/contacts_controller.rb
module Api
  module V1
    class ContactsController < ApplicationController
      skip_before_action :verify_authenticity_token
      
      def create
       @contact = Contact.new(contact_params)
  
        if @contact.save
          # Tenta enviar email mas não falha se der timeout
          begin
            # Timeout de 3 segundos máximo
            Timeout.timeout(3) do
              ContactMailer.new_contact(@contact).deliver_now
            end
          rescue Timeout::Error => e
            Rails.logger.warn "Email timeout (ignorado): #{e.message}"
          rescue => e
            Rails.logger.error "Email error (ignorado): #{e.message}"
          end
          
          # SEMPRE retorna sucesso, mesmo se email falhar
          render json: { 
            message: 'Mensagem recebida com sucesso! Entrarei em contato em breve.',
            contact: @contact 
          }, status: :created
        else
          render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
        end
      end
      
       private
  
        def contact_params
          params.require(:contact).permit(:name, :email, :phone, :subject, :service_type, :message)
        end
      end

    end
  end
