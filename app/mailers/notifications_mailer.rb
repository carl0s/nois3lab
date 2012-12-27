class NotificationsMailer < ActionMailer::Base

  default :from => "noreply@nois3lab.it"
  default :to => "info@nois3lab.it"

  def new_message(message)
    @message = message
    mail(:subject => "[nois3lab.it request] #{message.subject}")
  end

end
