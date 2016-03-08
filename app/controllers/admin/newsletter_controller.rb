class Admin::NewsletterController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @data = Newsletter.order('id DESC')
  end

  def new
    @data = Newsletter.new
  end

  def create
    @data = Newsletter.create(newsletter_params)
    if @data.save
      flash[:success] = "Newsletter added successfully."
      redirect_to admin_newsletter_index_path
    else
      flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to new_admin_newsletter_path
    end
  end

  def edit
    @data = Newsletter.find params[:id]
  end

  def update
    @data = Newsletter.find params[:id]
    if @data.update_attributes(newsletter_params)
    	flash[:success] = "Newsletter updated successfully."
    	redirect_to admin_newsletter_index_path
    else
    	flash[:danger] = @data.errors.full_messages.join('<br/>')
     	redirect_to new_admin_newsletter_path
    end
  end

  def show
  	@data = Newsletter.find params[:id]
  end

  def destroy
  	@data = Newsletter.find params[:id]
  	if @data.destroy
  		flash[:danger] = "Newsletter deleted successfully."
      redirect_to admin_newsletter_index_path
    else
    	flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to new_admin_newsletter_path
    end
  end

  def new_images_to_newsletter
  	 @data = Newsletter.find params[:id]
  	 @picture = @data.pictures.new
  end

  def add_images_to_newsletter
  	 @data = Newsletter.find params[:letter_id]
  	 @avatar = @data.pictures.create(avatar: params[:newsletter][:picture][:avatar])
  	 if @avatar.save
  	 	flash[:success] = "Picture added to newsletter successfully. Want to add more?"
      redirect_to '/admin/newsletter/new_images_to_newsletter/'+@data.id.to_s
  	 else
  	 	flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to new_admin_newsletter_path
  	 end
  end

  def show_images_of_newsletter
  	@data = Newsletter.find params[:id]
  	@avatar = @data.pictures
  end

  def edit_images_of_newsletter
  	@data = Picture.find params[:id]
  end

  def update_images_of_newsletter
  	@data = Picture.find params[:avatar_id]
  	if @data.update_attributes(avatar_update_params)
  		flash[:success] = "Picture updated successfully."
  		redirect_to '/admin/newsletter/show_images_of_newsletter/'+@data.imageable_id.to_s
  	else
  		flash[:danger] = @data.errors.full_messages.join('<br/>')
  		redirect_to '/admin/newsletter/edit_images_of_newsletter/'+@data.id.to_s
  	end
  end

  def delete_images_of_newsletter
  	@data = Picture.find params[:id]
  	@letter_id = @data.imageable_id
  	if @data.destroy
  		flash[:danger] = "Picture deleted successfully."
      redirect_to '/admin/newsletter/show_images_of_newsletter/'+@letter_id.to_s
    else
    	flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to '/admin/newsletter/show_images_of_newsletter/'+@letter_id.to_s
    end
  end

  def new_articles_to_newsletter
  	 @data = Newsletter.find params[:id]
  end

  def add_articles_to_newsletter
  	@data = Newsletter.find params[:letter_id]
  	@article = @data.articles.create(avatar:params[:newsletter][:article][:avatar],title: params[:newsletter][:article][:title],
  																	 author: params[:newsletter][:article][:author],description: params[:newsletter][:article][:description],
                                     intro: params[:newsletter][:article][:intro])

  	if @article.save
  		flash[:success] = "Article added to newsletter successfully. Want to add more?"
  		redirect_to '/admin/newsletter/new_articles_to_newsletter/'+@data.id.to_s
  	else
  		flash[:danger] = @data.errors.full_messages.join('<br/>')
  		redirect_to '/admin/newsletter/new_articles_to_newsletter/'+@data.id.to_s
  	end
  end

  def show_articles_of_newsletter
    @data = Newsletter.find params[:id]
    @articles = @data.articles
  end

  def edit_articles_of_newsletter
    @data = Article.find params[:id]
  end

  def update_articles_of_newsletter
    @data = Article.find params[:article_id]
    @letter_id =  @data.newsletter.id
    if @data.update_attributes(article_update_params)
      flash[:success] = "Article updated successfully."
      redirect_to '/admin/newsletter/show_articles_of_newsletter/'+@letter_id.to_s
    else
      flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to '/admin/newsletter/edit_articles_of_newsletter/'+@data.id.to_s
    end
  end

  def delete_articles_of_newsletter
    @data = Article.find params[:id]
    @letter_id =  @data.newsletter.id
    if @data.destroy
      flash[:danger] = "Article deleted successfully."
      redirect_to '/admin/newsletter/show_articles_of_newsletter/'+@letter_id.to_s
    else
      flash[:danger] = @data.errors.full_messages.join('<br/>')
      redirect_to '/admin/newsletter/show_articles_of_newsletter/'+@letter_id.to_s
    end
  end

  protected
    def newsletter_params
      params.require(:newsletter).permit(:title,:summary,:publisher_date,:cover_pic)
    end

    def avatar_update_params
    	params.require(:picture).permit(:avatar)
    end

    def article_update_params
      params.require(:article).permit(:avatar,:author,:title,:description,:intro)
    end
end
