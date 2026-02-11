# app/controllers/api/v1/contacts_controller.rb
module Api
  module V1
    class Api::V1::ContactsController < ApplicationController
      # Permite requisições de fora (CORS)
      skip_before_action :verify_authenticity_token
      
      # POST /api/v1/contacts
      def create
        # Pega os dados DIRETAMENTE dos params
        @contact = Contact.new(
          name: params.dig(:contact, :name),
          email: params.dig(:contact, :email),
          subject: params.dig(:contact, :subject),
          service_type: params.dig(:contact, :service_type),
          message: params.dig(:contact, :message)
        )
        
        # Tenta salvar no banco
        if @contact.save
          # ✅ Sucesso - contato salvo
          render json: { 
            success: true,
            message: 'Mensagem recebida com sucesso! Entrarei em contato em breve.',
            contact: {
              id: @contact.id,
              name: @contact.name,
              email: @contact.email,
              subject: @contact.subject
            }
          }, status: :created
        else
          # ❌ Falha - erro de validação
          render json: { 
            success: false,
            errors: @contact.errors.full_messages
          }, status: :unprocessable_entity
        end
      end
      
      # GET /api/v1/contacts (opcional - para listar)
      def index
        @contacts = Contact.all.order(created_at: :desc)
        render json: @contacts
      end
      
      # GET /api/v1/contacts/:id (opcional)
      def show
        @contact = Contact.find_by(id: params[:id])
        if @contact
          render json: @contact
        else
          render json: { error: 'Contato não encontrado' }, status: :not_found
        end
      end
    end
  end
end