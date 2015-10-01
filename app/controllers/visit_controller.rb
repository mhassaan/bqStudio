class VisitController < ApplicationController

	def index
		#@data= Visit.all.order('created_at DESC').paginate(:page => params[:page])
		@data = Visit.paginate(:per_page => 12, :page => params[:page]).order('publishing_date DESC')
		
	end

	def show
		@data=Visit.find(params[:id])
		@result = @data.pictures
	end
	
end
