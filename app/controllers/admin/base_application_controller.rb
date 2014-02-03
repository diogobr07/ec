#encoding: utf-8
class Admin::BaseApplicationController < ActionController::Base
  layout 'admin/application'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  delegate :current_user, :user_signed_in?, to: :admin_session

  helper_method :current_user, :user_signed_in?

  def admin_session
  	Session.new(session)
  end

  def require_authentication
  	unless user_signed_in?
  		redirect_to admin_root_path, alert: 'Usuário não autenticado!'	
  	end
  end

  def require_no_authentication
  	if user_signed_in?
  		redirect_to admin_dashboard_path, notice: 'Usuário já esta logado!'
  	end
  end

end
