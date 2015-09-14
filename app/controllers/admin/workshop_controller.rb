class Admin::WorkshopController < ApplicationController
	layout 'admin'

	def index
		@data = Workshop.all
	end

	def show
		@data = Workshop.find params[:id]
	end

	def new
		@data = Workshop.new
	end

	def create
		@data = Workshop.create(workshop_params)
    if @data.save
      flash[:success] = "Workshop added successfully."
      redirect_to admin_workshop_index_path
    else
      flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to new_admin_workshop_path
    end
	end

	def edit
		@data = Workshop.find params[:id]
	end

	def update
    @data = Workshop.find params[:id]
    if @data.update_attributes(workshop_params)
    	flash[:success] = "Workshop updated successfully."
    	redirect_to admin_workshop_index_path
    else
    	flash[:danger] = @data.errors.full_messages.join('<br/>')
     	redirect_to edit_admin_workshop_path
    end
  end

  def destroy
  	@data = Workshop.find params[:id]
  	if @data.destroy
  		flash[:danger] = "Workshop deleted successfully."
      redirect_to admin_workshop_index_path
    else
    	flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to new_admin_workshop_path
    end
  end

  def show_work_of_workshop
  	@data = Workshop.find params[:id]
  	@avatar = @data.pictures
  end

  def new_work_to_workshop
		 @data = Workshop.find params[:id]
		 @picture = @data.pictures.new
  end

  def add_work_to_workshop
  	 @data = Workshop.find params[:workshop_id]
  	 @avatar = @data.pictures.create(avatar: params[:workshop][:picture][:avatar])
  	 if @avatar.save
  	 	flash[:success] = "Picture added to workshop successfully. Want to add more?"
      redirect_to '/admin/workshop/new_work_to_workshop/'+@data.id.to_s
  	 else
  	 	flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to '/admin/workshop/new_work_to_workshop/'+@data.id.to_s
  	 end
  end

  def edit_work_of_workshop
  	@data = Picture.find params[:id]
  end

  def update_work_of_workshop
  	@data = Picture.find params[:avatar_id]
  	if @data.update_attributes(avatar_update_params)
  		flash[:success] = "Work updated successfully."
  		redirect_to '/admin/workshop/show_work_of_workshop/'+@data.imageable_id.to_s
  	else
  		flash[:danger] = @data.errors.full_messages.join('<br/>')
  		redirect_to '/admin/workshop/edit_work_of_workshop/'+@data.id.to_s
  	end
  end

  def delete_work_of_workshop
    @data = Picture.find params[:id]
  	@workshop_id = @data.imageable_id
  	if @data.destroy
  		flash[:danger] = "Work deleted successfully."
      redirect_to '/admin/workshop/show_work_of_workshop/'+@workshop_id.to_s
    else
    	flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to '/admin/workshop/show_work_of_workshop/'+@workshop_id.to_s
    end
  end

	protected
		def workshop_params
			params.require(:workshop).permit(:name,:location,:desc,:cover_pic,:intro,:publishing_date)
		end

		def avatar_update_params
    	params.require(:picture).permit(:avatar)
    end
end
