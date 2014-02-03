#encoding: utf-8
class Admin::SlidersController < Admin::ApplicationController
	
	def index
		@sliders = Slider.all
	end

	def new
		@slider = Slider.new
	end

	def create
		@slider = Slider.new(slider_params)
		if @slider.save
			redirect_to admin_slider_path(@slider), notice: 'Novo Slider criado!'
		else
			render :new
		end
	end

	def show
		@slider = Slider.find(params[:id])
	end

	def edit
		@slider = Slider.find(params[:id])
	end

	def update
		@slider = Slider.find(params[:id])
		if @slider.update(slider_params)
			redirect_to admin_slider_path(@slider), notice: 'Slider atualizado'
		else
			render :edit
		end
	end

	def destroy
		@slider = Slider.find(params[:id])
		@slider.destroy
		redirect_to admin_sliders_path, notice: 'Slider excluído'
	end

	private

	def slider_params
		params.require(:slider).permit(:identifier)
	end

end
