require 'digest/sha2'

class UserMailer < ActionMailer::Base
  default from: 'libranner@gmail.com'

  def role_changed(user)
    @user = user
    attachments.inline['logo.png'] = File.read(Rails.root.join('app/assets/images/logo-ARIS.png'))
    mail(:to => user.email, subject: 'Admin has changed your role')
  end
end
