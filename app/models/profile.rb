class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :age, :first_name, :last_name
  # validates :first_name, :last_name, :age, presence: true
end