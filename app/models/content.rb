class Content < ActiveRecord::Base
	belongs_to :note
	mount_uploader :content_img, ImageUploader
end
