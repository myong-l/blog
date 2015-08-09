class Note < ActiveRecord::Base
	belongs_to :user
	has_many :contents, dependent: :destroy
	accepts_nested_attributes_for :contents, allow_destroy: true
end
