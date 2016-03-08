class Admin::BannerController < ApplicationController
	layout 'admin'
	before_action :authenticate_admin!

	def index
		@data = Banner.all
	end

	def show
		@data = Banner.find params[:id]
	end

	def new
		@data = Banner.new
	end

	def create
		@data = Banner.create(banner_params)
    if @data.save
      flash[:success] = "Banner added successfully."
      redirect_to admin_banner_index_path
    else
      flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to new_admin_banner_path
    end
	end

	def edit
		@data = Banner.find params[:id]
	end

	def update
    @data = Banner.find params[:id]
    if @data.update_attributes(banner_params)
    	flash[:success] = "Banner updated successfully."
    	redirect_to admin_banner_index_path
    else
    	flash[:danger] = @data.errors.full_messages.join('<br/>')
     	redirect_to edit_admin_banner_path
    end
  end

  def destroy
  	@data = Banner.find params[:id]
  	if @data.destroy
  		flash[:danger] = "Banner deleted successfully."
      redirect_to admin_banner_index_path
    else
    	flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to new_admin_banner_path
    end
  end

  protected
  	def banner_params
  		params.require(:banner).permit(:avatar)
  	end
end
