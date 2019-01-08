# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  # before_action :authenticate_admin!
  #
  # before_action :check_expire ,only: [:create]
  #   def check_expire
  #     unless current_admin.expired_at.to_i > Time.now.to_i
  #
  #       @notice1 =  'Your account was expired ! Please contact Admin to be supported .'
  #     end
  #   end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create

      self.resource = warden.authenticate!(auth_options)
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)



  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:expired_at])
  end
end
