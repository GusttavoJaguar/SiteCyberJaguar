class ContactMailer < ApplicationMailer
  default from: 'gutumendes8@gmail.com'
  
  def contact_email(contact)
    @contact = contact
    
    mail(
      to: 'gutumendes8@gmail.com',  # E-mail que receberá os contatos
      subject: "Novo contato: #{contact[:subject]}"
    )
  end
end