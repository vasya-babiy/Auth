class Admin < ActiveRecord::Base

  include Authorization

  attr_accessible :email, :password, :password_confirmation
  has_one :profile, as: :profileable
  belongs_to :role


  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, on: :create
  validates_presence_of :email
  validates_uniqueness_of :email

end
