class ApplicationController < ActionController::Base
  before_action :authenticate_user! # devise stuff
  include Pundit::Authorization

  # Pundit: allow-list approach - "destroy every single page of our app!!"
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Fran (for devise)- JUST IN CASE WE NEED TO ADD ATTRIBUTES TO USER!!! :configure_permitted_parameters, if: :devise_controller?

  # def configure_permitted_parameters
  # For additional fields in app/views/devise/registrations/new.html.erb
  # devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  #
  # For additional in app/views/devise/registrations/edit.html.erb
  # devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  # end

  # LeWagon (warning message) Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
