module ApplicationHelper

def title(string)

	return string

end
	def assign_cover

		@album_images = AlbumImage.where("album_id == ?", params[:id])
		@album_images.each do |album_image|
			album_image.update_attributes(:cover => false)
		end

		@album_image = AlbumImage.find(params[:cover])
		@album_image.update_attributes(:cover => true)
	
	end

end
