class Admin::ResidancyController < ApplicationController

	layout 'admin'

	def index
		@data = Residancy.all
	end

	def show
		@data = Residancy.find params[:id]
	end

	def new
		@data = Residancy.new
	end

	def create
		@data = Residancy.create(residancy_params)
    if @data.save
      flash[:success] = "Residancy added successfully."
      redirect_to admin_residancy_index_path
    else
      flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to new_admin_residancy_path
    end
	end

	def edit
		@data = Residancy.find params[:id]
	end

	def update
    @data = Residancy.find params[:id]
    if @data.update_attributes(residancy_params)
    	flash[:success] = "Residancy updated successfully."
    	redirect_to admin_residancy_index_path
    else
    	flash[:danger] = @data.errors.full_messages.join('<br/>')
     	redirect_to edit_admin_residancy_path
    end
  end

  def destroy
  	@data = Residancy.find params[:id]
  	if @data.destroy
  		flash[:danger] = "Residancy deleted successfully."
      redirect_to admin_residancy_index_path
    else
    	flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to new_admin_residancy_path
    end
  end

  def show_work_of_residancy
  	@data = Residancy.find params[:id]
  	@avatar = @data.pictures
  end

  def new_work_to_residancy
		 @data = Residancy.find params[:id]
		 @picture = @data.pictures.new
  end

  def add_work_to_residancy
  	 @data = Residancy.find params[:residancy_id]
  	 @avatar = @data.pictures.create(avatar: params[:residancy][:picture][:avatar])
  	 if @avatar.save
  	 	flash[:success] = "Picture added to Residancy successfully. Want to add more?"
      redirect_to '/admin/residancy/new_work_to_residancy/'+@data.id.to_s
  	 else
  	 	flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to '/admin/residancy/new_work_to_residancy/'+@data.id.to_s
  	 end
  end

  def edit_work_of_residancy
  	@data = Picture.find params[:id]
  end

  def update_work_of_residancy
  	@data = Picture.find params[:avatar_id]
  	if @data.update_attributes(avatar_update_params)
  		flash[:success] = "Work updated successfully."
  		redirect_to '/admin/residancy/show_work_of_residancy/'+@data.imageable_id.to_s
  	else
  		flash[:danger] = @data.errors.full_messages.join('<br/>')
  		redirect_to '/admin/residancy/edit_work_of_residancy/'+@data.id.to_s
  	end
  end

  def delete_work_of_residancy
    @data = Picture.find params[:id]
  	@residancy_id = @data.imageable_id
  	if @data.destroy
  		flash[:danger] = "Work deleted successfully."
      redirect_to '/admin/residancy/show_work_of_residancy/'+@residancy_id.to_s
    else
    	flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to '/admin/residancy/show_work_of_residancy/'+@residancy_id.to_s
    end
  end

  protected
  	def residancy_params
  		params.require(:residancy).permit(:name,:location,:desc,:cover_pic,:publishing_date,:intro)
  	end

  	def avatar_update_params
    	params.require(:picture).permit(:avatar)
    end
end
