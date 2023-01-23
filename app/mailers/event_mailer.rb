class EventMailer < ApplicationMailer
  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = event

    mail to: event.user.email, subject: "#{name} подписался на мероприятие '#{event.title}'"
  end

  def comment(event, comment, email)
    @comment = comment
    @event = event

    mail to: email, subject: "Новый комментарий в '#{event.title}' от @#{comment.user.name}"
  end

  def photo(event, email, photo)
    @event = event
    @photo = photo

    mail to: email, subject: "Новое фото в мероприятии '#{event.title}'"
  end
end
