class NewsletterController < ApplicationController
	def index
		#@data= Visit.all.order('created_at DESC').paginate(:page => params[:page])
		@data = Newsletter.paginate(:per_page => 6, :page => params[:page]).order('id DESC')		
	end

	def show
		@data = Newsletter.find params[:id]
		@result = @data.pictures 
		@articles = @data.articles
	  @next = Newsletter.where("id > ?", @data.id).order("id ASC").first || Newsletter.first
	  @previous = Newsletter.where("id < ?", @data.id).order("id DESC ").first 	|| Newsletter.last

	end

	def article_detail
		@data = Article.find params[:id]
	end
end
