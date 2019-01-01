class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  #
  # before_action :check_expire ,if: :devise_controller?
  # before_action :authenticate_admin!
  # private
  # def check_expire
  #   unless current_admin.expired_at.minutes < Time.now.minutes
  #     redirect_to root_path ,notice: 'Your account was expired ! Please contact Admin to be supported .'
  #   end
  # end
  protected
    def after_sign_in_path_for resource
      root_path
    end
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:expired_at,:role])
    end

end
