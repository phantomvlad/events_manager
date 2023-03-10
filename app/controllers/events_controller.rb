class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  before_action :set_event, only: [:show, :edit, :destroy]

  after_action :verify_authorized

  def index
    authorize Event
    @events = policy_scope(Event)
  end

  def new
    @event = current_user.events.build
    authorize @event
  end

  def edit
    authorize @event
  end

  def create
    @event = current_user.events.build(event_params)

    authorize @event

    if @event.save
      redirect_to @event, notice: I18n.t("controllers.events.created")
    else
      render :new
    end
  end

  def show
    if params[:pincode].present? && @event.pincode_valid?(params[:pincode])
      cookies.permanent["events_#{@event.id}_pincode"] = params[:pincode]
    end

    authorize @event

    @new_comment = @event.comments.build(params[:comment])
    @new_subscription = @event.subscriptions.build(params[:subscription])
    @new_photo = @event.photos.build(params[:photo])

  rescue Pundit::NotAuthorizedError
    flash.now[:alert] = t("pundit.false_pincode") if params[:pincode].present?

    render "password_form", status: :unauthorized
  end

  def update
    authorize @event

    if @event.update(event_params)
      redirect_to @event, notice: I18n.t("controllers.events.updated")
    else
      render :edit
    end
  end

  def destroy
    authorize @event

    @event.destroy
    redirect_to events_url, notice: I18n.t("controllers.events.destroyed")
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :address, :datetime, :description,  :photo, :event_avatar, :pincode)
  end
end
