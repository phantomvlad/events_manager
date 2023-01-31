class EventMailer < ApplicationMailer
  def subscription(subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = subscription.event

    mail to: @event.user.email, subject: default_i18n_subject(subscriber: @name, event_title: @event.title)
  end

  def comment(comment, email)
    @comment = comment

    if @comment.user.present?
      mail to: email, subject: default_i18n_subject(user_comment: @comment.user.name, event_title: @comment.event.title)
    else
      mail to: email, subject: default_i18n_subject(user_comment: @comment.user_name, event_title: @comment.event.title)
    end
  end

  def photo(email, photo)
    @photo = photo

    mail to: email, subject: default_i18n_subject(user_photo: @photo.user.name, event_title: @photo.event.title)
  end
end
