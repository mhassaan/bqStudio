class Visit < ActiveRecord::Base
	has_many :pictures ,as: :imageable 
	has_attached_file :cover_pic, :styles => { :natural=>"550x367>",:medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :cover_pic, :content_type => /\Aimage\/.*\Z/
end
