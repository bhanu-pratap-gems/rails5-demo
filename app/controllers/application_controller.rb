class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  def authenticate_by_api_token!
  	current_user
  end
end
