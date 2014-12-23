class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :age, :first_name, :last_name, :image
  mount_uploader :image, ImageUploader
  # validates :first_name, :last_name, :age, presence: true
end