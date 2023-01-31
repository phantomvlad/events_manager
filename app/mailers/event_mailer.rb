class EventMailer < ApplicationMailer
  def subscription(subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = subscription.event

    mail to: @event.user.email, subject: "#{@name} подписался на мероприятие '#{@event.title}'"
  end

  def comment(comment, email)
    @comment = comment

    if @comment.user.present?
      mail to: email, subject: "Новый комментарий в '#{@comment.event.title}' от @#{@comment.user.name}"
    else
      mail to: email, subject: "Новый комментарий в '#{@comment.event.title}' от @#{@comment.user_name}"
    end
  end

  def photo(email, photo)
    @photo = photo

    mail to: email, subject: "Новое фото в мероприятии '#{@photo.event.title}'"
  end
end
