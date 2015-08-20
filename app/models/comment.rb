class Comment < ActiveRecord::Base
  belongs_to :note
  validates :commenter, presence: true
  validates :body, presence: true
end
