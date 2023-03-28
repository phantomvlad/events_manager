class EventMailer < ApplicationMailer
  def subscription(subscription, email)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = subscription.event

    mail to: @event.user.email, subject: default_i18n_subject(subscriber: @name, event_title: @event.title)
  end

  def comment(comment, email)

    @comment = comment
    mail to: email, subject: default_i18n_subject(user_comment: @comment.user_name, event_title: @comment.event.title)
  end

  def photo(photo, email)
    @photo = photo

    mail to: email, subject: default_i18n_subject(user_photo: @photo.user.name, event_title: @photo.event.title)
  end
end
