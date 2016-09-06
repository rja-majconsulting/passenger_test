class ApplicationMailer < ActionMailer::Base
  default from: 'info@vivasport.be'

  def contact(contact)
    @contact = contact
    mail( :to => 'marchetti.sebastien@gmail.com',
          :subject => t('contact_send_subject', firstName: contact.firstName, lastName: contact.lastName),
          :reply_to => contact.email)
  end
end

