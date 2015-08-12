class VisitController < ApplicationController

	def index
		#@data= Visit.all.order('created_at DESC').paginate(:page => params[:page])
		@data = Visit.paginate(:per_page => 6, :page => params[:page]).order('created_at DESC')
		
	end

	def show
		@data = Visit.find params[:id]
		@result = @data.pictures 
	end
	
end