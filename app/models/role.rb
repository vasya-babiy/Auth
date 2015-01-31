class Role < ActiveRecord::Base
	has_one :admin
  attr_accessible :admin, :superadmin, :name
end
