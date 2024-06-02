# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@dev.com'
  layout 'mailer'
end
