#encoding: utf-8
class Admin::UsersController < Admin::ApplicationController
	
	before_action :can_change, only: [:edit, :update]

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
  		@user = User.new
  end

	def create
   		@user = User.new(user_params)

		if @user.save
			redirect_to admin_user_path(@user), notice: 'Usuário criado!'
		else
			render :new
		end
  end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to admin_user_path(@user), notice: 'Usuário atualizado!'
		else
			render :edit
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def can_change
		unless user_signed_in? && current_user == user
			redirect_to admin_user_path(params[:id]), notice: 'Você só pode editar o seu usuário'
		end
	end

	def user
		@user ||= User.find(params[:id])
	end

end
