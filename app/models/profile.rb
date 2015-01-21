class Profile < ActiveRecord::Base
  belongs_to :profileable, polymorphic: true
  attr_accessible :age, :first_name, :last_name, :image, :profileable_id, :profileable_type
  mount_uploader :image, ImageUploader
  # validates :first_name, :last_name, :age, presence: true
end