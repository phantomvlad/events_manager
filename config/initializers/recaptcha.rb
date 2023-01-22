Recaptcha.configure do |config|
  config.site_key  = Rails.application.credentials.dig(:recaptcha_html)
  config.secret_key = Rails.application.credentials.dig(:recaptcha_secret)
end
