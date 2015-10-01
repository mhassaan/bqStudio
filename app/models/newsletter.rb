class Newsletter < ActiveRecord::Base
	has_many :pictures, as: :imageable
	has_many :articles
  has_attached_file :cover_pic, :styles => { :natural=>"550x367>",:medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :cover_pic, :content_type => /\Aimage\/.*\Z/

  def next
    #self.where("id > ?", id).first
    Newsletter.where("publisher_date > ?", publisher_date).order("publisher_date ").first || Newsletter.first
  end

  def previous
    #self.where("id < ?", id).last
  	Newsletter.where("publisher_date < ?", publisher_date).order("publisher_date ").first || Newsletter.first	
  end

end
