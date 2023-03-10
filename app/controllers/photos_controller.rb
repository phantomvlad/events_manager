class PhotosController < ApplicationController
  before_action :set_event, only: %i[create destroy]
  before_action :set_photo, only: :destroy

  def create
    @new_photo = @event.photos.build(photo_params)
    @new_photo.user = current_user

    if @new_photo.save
      notify_subscribers_photo(@new_photo)

      redirect_to @event, notice: I18n.t('controllers.photos.created')
    else
      render 'events/show', alert: I18n.t('controllers.photos.error')
    end
  end

  def destroy
    message = { notice: I18n.t('controllers.photos.destroyed') }

    if current_user_can_edit?(@photo)
      @photo.destroy!
    else
      message = { alert: I18n.t('controllers.photos.error') }
    end

    redirect_to @event, message
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_photo
    @photo = @event.photos.find(params[:id])
  end

  def photo_params
    params.fetch(:photo, {}).permit(:image)
  end

  def notify_subscribers_photo(new_photo)
    all_emails = (new_photo.event.subscriptions.map(&:user_email) + [new_photo.event.user.email] - [new_photo.user.email]).uniq

    all_emails.each do |mail|
      EventMailer.photo(mail, new_photo).deliver_later
    end
  end
end
