class ResidancyController < ApplicationController

	def index
		#@data= Visit.all.order('created_at DESC').paginate(:page => params[:page])
		@data = Residancy.paginate(:per_page => 12, :page => params[:page]).order('publishing_date DESC')
		
	end

	def show
		@data = Residancy.find params[:id]
		@result = @data.pictures 
	end

end
