class Admin::ArtistController < ApplicationController
	layout 'admin'

	def index
		@data = Artist.all
	end

	def show
		@data = Artist.find params[:id]
	end

	def new
		@data = Artist.new
	end

	def create
		@data = Artist.create(artist_params)
    if @data.save
      flash[:success] = "Artist added successfully."
      redirect_to admin_artist_index_path
    else
      flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to new_admin_artist_path
    end
	end

	def edit
		@data = Artist.find params[:id]
	end

	def update
    @data = Artist.find params[:id]
    if @data.update_attributes(artist_params)
    	flash[:success] = "Artist updated successfully."
    	redirect_to admin_artist_index_path
    else
    	flash[:danger] = @data.errors.full_messages.join('<br/>')
     	redirect_to edit_admin_artist_path
    end
  end

  def destroy
  	@data = Artist.find params[:id]
  	if @data.destroy
  		flash[:danger] = "Artist deleted successfully."
      redirect_to admin_artist_index_path
    else
    	flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to new_admin_artist_path
    end
  end

  def new_work_to_artist
		 @data = Artist.find params[:id]
		 @picture = @data.pictures.new
  end

  def add_work_to_artist
  	 @data = Artist.find params[:artist_id]
  	 @avatar = @data.pictures.create(avatar: params[:artist][:picture][:avatar])
  	 if @avatar.save
  	 	flash[:success] = "Picture added to artist successfully. Want to add more?"
      redirect_to '/admin/artist/new_work_to_artist/'+@data.id.to_s
  	 else
  	 	flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to '/admin/artist/new_work_to_artist/'+@data.id.to_s
  	 end
  end

  def show_work_of_artist
  	@data = Artist.find params[:id]
  	@avatar = @data.pictures
  end

  def edit_work_of_artist
  	@data = Picture.find params[:id]
  end

  def update_work_of_artist
  	@data = Picture.find params[:avatar_id]
  	if @data.update_attributes(avatar_update_params)
  		flash[:success] = "Work updated successfully."
  		redirect_to '/admin/artist/show_work_of_artist/'+@data.imageable_id.to_s
  	else
  		flash[:danger] = @data.errors.full_messages.join('<br/>')
  		redirect_to '/admin/artist/edit_work_of_artist/'+@data.id.to_s
  	end
  end

  def delete_work_of_artist
    @data = Picture.find params[:id]
  	@artist_id = @data.imageable_id
  	if @data.destroy
  		flash[:danger] = "Work deleted successfully."
      redirect_to '/admin/artist/show_work_of_artist/'+@artist_id.to_s
    else
    	flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to '/admin/artist/show_work_of_artist/'+@artist_id.to_s
    end
  end

	protected
		def artist_params
			params.require(:artist).permit(:name,:work_desc,:cover_pic,:publishing_date)
		end

		def avatar_update_params
    	params.require(:picture).permit(:avatar)
    end

end
