class Banner < ActiveRecord::Base
	has_attached_file :avatar,:path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:filename",
                            :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
