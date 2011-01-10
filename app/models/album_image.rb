class AlbumImage < ActiveRecord::Base
  attr_accessible :album_id, :title, :description, :image

   belongs_to :album

has_attached_file :image, :url => "/assets/album_images/:id/:style/:basename.:extension",
	:path => ":rails_root/public/assets/album_images/:id/:style/:basename.:extension"

end
