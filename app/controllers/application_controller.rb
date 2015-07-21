class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_filter :store_location

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get? 
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    end
  end

def after_sign_in_path_for(resource)
  session[:previous_url] || root_path
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:account_update) << :first_name
    devise_parameter_sanitizer.for(:account_update) << :last_name
    devise_parameter_sanitizer.for(:account_update) << :username
    devise_parameter_sanitizer.for(:account_update) << :nickname
    devise_parameter_sanitizer.for(:account_update) << :gender
    devise_parameter_sanitizer.for(:account_update) << :headline
    devise_parameter_sanitizer.for(:account_update) << :social
    devise_parameter_sanitizer.for(:account_update) << :location
    devise_parameter_sanitizer.for(:account_update) << :website
    devise_parameter_sanitizer.for(:account_update) << :favorite_website
    devise_parameter_sanitizer.for(:account_update) << :image
    devise_parameter_sanitizer.for(:account_update) << :about
  end
  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end

  # helper_method :current_user

end
