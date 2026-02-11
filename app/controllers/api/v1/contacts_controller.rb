# app/controllers/api/v1/contacts_controller.rb
module Api
  module V1
    class ContactsController < ApplicationController
      skip_before_action :verify_authenticity_token
      
      def create
      @contact = Contact.new(
      name: params[:contact][:name],
      email: params[:contact][:email],
      subject: params[:contact][:subject],
      service_type: params[:contact][:service_type],
      message: params[:contact][:message]
    )

      if @contact.save
        render json: { message: 'Sucesso!' }, status: :created
      else
        render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
      end

    end  
  end
end