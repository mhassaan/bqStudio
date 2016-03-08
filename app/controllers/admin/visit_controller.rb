class Admin::VisitController < ApplicationController
	layout 'admin'
	before_action :authenticate_admin!
	
	def index
		@data = Visit.all
	end

	def show
		@data = Visit.find params[:id]
	end

	def new
		@data = Visit.new
	end

	def create
		@data = Visit.create(visit_params)
    if @data.save
      flash[:success] = "Visit added successfully."
      redirect_to admin_visit_index_path
    else
      flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to new_admin_visit_path
    end
	end

	def edit
		@data = Visit.find params[:id]
	end

	def update
    @data = Visit.find params[:id]
    if @data.update_attributes(visit_params)
    	flash[:success] = "Visit updated successfully."
    	redirect_to admin_visit_index_path
    else
    	flash[:danger] = @data.errors.full_messages.join('<br/>')
     	redirect_to edit_admin_visit_path
    end
  end

  def destroy
  	@data = Visit.find params[:id]
  	if @data.destroy
  		flash[:danger] = "Visit deleted successfully."
      redirect_to admin_visit_index_path
    else
    	flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to new_admin_visit_path
    end
  end

  def show_work_of_visit
  	@data = Visit.find params[:id]
  	@avatar = @data.pictures
  end

  def new_work_to_visit
		 @data = Visit.find params[:id]
		 @picture = @data.pictures.new
  end

  def add_work_to_visit
  	 @data = Visit.find params[:visit_id]
  	 @avatar = @data.pictures.create(avatar: params[:visit][:picture][:avatar])
  	 if @avatar.save
  	 	flash[:success] = "Picture added to visit successfully. Want to add more?"
      redirect_to '/admin/visit/new_work_to_visit/'+@data.id.to_s
  	 else
  	 	flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to '/admin/visit/new_work_to_visit/'+@data.id.to_s
  	 end
  end

  def edit_work_of_visit
  	@data = Picture.find params[:id]
  end

  def update_work_of_visit
  	@data = Picture.find params[:avatar_id]
  	if @data.update_attributes(avatar_update_params)
  		flash[:success] = "Work updated successfully."
  		redirect_to '/admin/visit/show_work_of_visit/'+@data.imageable_id.to_s
  	else
  		flash[:danger] = @data.errors.full_messages.join('<br/>')
  		redirect_to '/admin/visit/edit_work_of_visit/'+@data.id.to_s
  	end
  end

  def delete_work_of_visit
    @data = Picture.find params[:id]
  	@visit_id = @data.imageable_id
  	if @data.destroy
  		flash[:danger] = "Work deleted successfully."
      redirect_to '/admin/visit/show_work_of_visit/'+@visit_id.to_s
    else
    	flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to '/admin/visit/show_work_of_visit/'+@visit_id.to_s
    end
  end

	protected
		def visit_params
			params.require(:visit).permit(:name,:location,:desc,:cover_pic,:publishing_date,:intro)
		end

		def avatar_update_params
    	params.require(:picture).permit(:avatar)
    end
end
