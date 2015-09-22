class Article < ActiveRecord::Base
	belongs_to :newsletter
	has_attached_file :avatar, :styles => { :natural=>"550x367>",:medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def next
  	@data = Article.where("id > ?", id).order("id ASC").first || Article.first
  	@data.id
  end

  def previous
  	@data = Article.where("id < ?", id).order("id ASC").last || Article.last
  	@data.id
  end
end
