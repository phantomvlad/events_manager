class MailerJob < ApplicationJob
  queue_as :default

  def perform(event, model)
    all_emails = (event.subscriptions.map(&:user_email) + [event.user.email]).uniq
    all_emails.delete(model.user&.email)

    all_emails.each do |mail|
      EventMailer.public_send(model.class.model_name.singular, model, mail).deliver_now
    end
  end
end
