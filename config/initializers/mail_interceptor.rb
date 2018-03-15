options = { forward_emails_to: 'carly.k.p@gmail.com',
            deliver_emails_to: ["carly.k.p@gmail.com"] }

unless (Rails.env.test? || Rails.env.production?)
  interceptor = MailInterceptor::Interceptor.new(options)
  ActionMailer::Base.register_interceptor(interceptor)
end
