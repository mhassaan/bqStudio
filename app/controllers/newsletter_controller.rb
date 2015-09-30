class NewsletterController < ApplicationController
	def index
		#@data= Visit.all.order('created_at DESC').paginate(:page => params[:page])
		@data = Newsletter.paginate(:per_page => 12, :page => params[:page]).order('created_at DESC')
		
	end

	def show
		@data = Newsletter.find params[:id]
		@result = @data.pictures 
		@articles = @data.articles
	end

	def article_detail
		@data = Article.find params[:id]
	end
end
