class SendBillingMailer < ApplicationMailer

  def sample_email(guest , billing)
    @guest = guest
    @billing = billing
    mail to: @guest.email, subject: "Notice billing"
  end
end
