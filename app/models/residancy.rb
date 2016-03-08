class Residancy < ActiveRecord::Base
	has_many :pictures ,as: :imageable 
	has_attached_file :cover_pic, :styles => { :natural=>"550x367>",:medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :cover_pic, :content_type => /\Aimage\/.*\Z/

  def next
    #self.where("id > ?", id).first
    Residancy.where("id > ?", id).order("id ASC").first || Residancy.first
  end

  def previous
    #self.where("id < ?", id).last
  	Residancy.where("id < ?", id).order("id DESC").first || Residancy.first
  end
end
