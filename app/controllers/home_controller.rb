class HomeController < ApplicationController

	def index
		@data = Visit.paginate(:per_page => 6, :page => params[:page]).order('created_at DESC')		 
	end
	
end
