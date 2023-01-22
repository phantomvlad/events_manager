Recaptcha.configure do |config|
  config.site_key  = Rails.application.credentials.dig(:RECAPTCHA_ASKME_PUBLIC_KEY)
  config.secret_key = Rails.application.credentials.dig(:RECAPTCHA_ASKME_PRIVATE_KEY)
end
