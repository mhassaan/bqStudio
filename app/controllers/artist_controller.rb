class ArtistController < ApplicationController

	def index
		#@data= Visit.all.order('created_at DESC').paginate(:page => params[:page])
		@data = Artist.paginate(:per_page => 12, :page => params[:page]).order('created_at DESC')
		
	end

	def show
		@data = Artist.find params[:id]
		@result = @data.pictures 
	end

end
