class ApplicationController < ActionController::Base
  protect_from_forgery

  def admin_sign_in_redirect
    if current_admin
      path = admin_dashboard_path
    else
      path = services_path
    end
    redirect_to path
  end

  def devise_registration_redirect
    unless current_admin
      redirect_to new_user_session_path
    end
  end
end
