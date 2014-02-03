class Admin::SlidesController < Admin::ApplicationController
	def new
		@slider = Slider.find(params[:slider_id])
		@slide = Slide.new
	end

	def create
		@slider = Slider.find(params[:slider_id])
		@slide = @slider.slides.build(slide_params)

		if @slide.save
			redirect_to admin_slider_path(@slider), notice: 'Item adcionado!'
		else
			render :new
		end
	end

	def edit
		@slider = Slider.find(params[:slider_id])
		@slide = @slider.slides.find(params[:id])
	end

	def update
		@slider = Slider.find(params[:slider_id])
		@slide = @slider.slides.find(params[:id])
		if @slide.update(slide_params)
			redirect_to admin_slider_path(@slider), notice: 'Item atualizado!'
		else
			render :edit
		end
	end

	def destroy
		@slider = Slider.find(params[:slider_id])
		@slide = @slider.slides.find(params[:id])
		@slide.destroy
		redirect_to admin_slider_path(@slider), notice: 'Item excluido!'
	end

	private

	def slide_params
		params.require(:slide).permit(:title, :description, :link, :display_order, :enabled, :image)
	end
end
