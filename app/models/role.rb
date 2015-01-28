class Role < ActiveRecord::Base
	has_one :admin
	has_one :user
  attr_accessible :admin, :superadmin, :name
end
