class HealthController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    render json: {
      status: 'ok',
      message: 'Cyber Jaguar API está online!',
      timestamp: Time.now.iso8601,
      version: '1.0.0'
    }
  end
end