class ApiController < ActionController::Base
  protect_from_forgery with: :null_session
  include Pundit
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :set_locale

  def set_locale
    I18n.locale = current_api_v1_user&.locale || I18n.default_locale
  end
  
  def pundit_user
    current_api_v1_user
  end
end
