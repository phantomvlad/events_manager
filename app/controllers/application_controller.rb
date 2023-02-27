class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user_can_edit?

  def pundit_user
    UserContext.new(current_user, { cookies: cookies, pincode: params[:pincode] })
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: [:password, :password_confirmation, :current_password]
    )

    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [:name]
    )
  end

  def current_user_can_edit?(model)
   user_signed_in? && (model.user == current_user ||
     (model.try(:event).present? && model.event.user == current_user))
  end

  def check_captcha(model)
    current_user.present? || verify_recaptcha(model: model)
  end

  def user_not_authorized
    flash[:alert] = t('pundit.not_authorized')
    redirect_to(request.referrer || root_path)
  end
end
