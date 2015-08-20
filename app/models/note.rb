class Note < ActiveRecord::Base
	belongs_to :user
	has_many :contents, dependent: :destroy
	has_many :comments, dependent: :destroy
	accepts_nested_attributes_for :contents, allow_destroy: true

	def self.search(search) 
		if search 
			Note.where(['title LIKE ?', "%#{search}%"])
		else
			Note.all 
		end
	end
end
