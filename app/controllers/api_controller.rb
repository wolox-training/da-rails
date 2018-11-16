class ApiController < ActionController::Base
  protect_from_forgery with: :null_session
  include Pundit
  include DeviseTokenAuth::Concerns::SetUserByToken

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :set_locale

  def set_locale
    I18n.locale = current_api_v1_user&.locale || I18n.default_locale
  end

  def pundit_user
    current_api_v1_user
  end

  def user_not_authorized
    render json: { errors: t('devise.failure.unauthorized') }, status: :unauthorized
  end
end
