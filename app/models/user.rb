class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :roles
  def has_role?(name)
    self.roles.where(name: name).length > 0
  end
  has_many :notes, :dependent => :destroy
  accepts_nested_attributes_for :notes
  mount_uploader :image, ImageUploader
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
end
