class Contact < ApplicationRecord
  validates :name, :email, :message, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
   validates :name, presence: true
  validates :email, presence: true
 
  validates :message, presence: true
  # Enum para os tipos de serviço (igual ao seu formulário)
   #enum service_type: {
    # web: "Desenvolvimento Web",
   #  mobile: "Desenvolvimento Mobile",
    # security: "Segurança Cibernética",
   #  cloud: "Cloud Computing",
    # hardware: "Hardware",
   #  software: "Software",
   #  networks: "Redes",
   #  marketing: "Marketing Digital",
    # consulting: "Consultoria em TI",
   #  other: "Outro"
   #}
   
end