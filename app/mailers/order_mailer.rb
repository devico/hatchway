# This is class Mailer for send reminders to users
require 'mailgun'
class OrderMailer < ApplicationMailer
  def send_mail_order(message)
    mail_from = 'gregaroyo@gmail.com'
    # mail_to = 'pirjsuka@gmail.com'
    mail_to = 'clamdm@gmail.com'
    mg_client = Mailgun::Client.new ENV['MAILGUN_API']
    message_params =  { from: mail_from,
                      to: mail_to,
                      subject: 'New order',
                      text: message }
    mg_client.send_message ENV['MAILGUN_DOMAIN'], message_params
  end
end
