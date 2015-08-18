class ResidancyController < ApplicationController

	def index
		#@data= Visit.all.order('created_at DESC').paginate(:page => params[:page])
		@data = Residancy.paginate(:per_page => 6, :page => params[:page]).order('created_at DESC')
		
	end

	def show
		@data = Residancy.find params[:id]
		@result = @data.pictures 
	end

end
