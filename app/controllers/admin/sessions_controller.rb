#encoding: utf-8
class Admin::SessionsController < Admin::BaseApplicationController
  layout 'admin/login'

  before_action :require_no_authentication, only: [:new, :create]
  before_action :require_authentication, only: :destroy

  def new
  	@session = Session.new(session)
  end

  def create
  	@session = Session.new(session, params[:session])
  	if @session.authenticate!
  		redirect_to admin_dashboard_path, notice: 'Usuário autenticado!'
  	else
  		render :new
  	end
  end

  def destroy
    session.destroy
    redirect_to admin_root_path
  end
end
