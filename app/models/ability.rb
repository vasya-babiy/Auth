# class Ability
#   include CanCan::Ability
#   def initialize(user)
#     user ||= User.new
#     can [:new, :create], User
#     can [:show, :edit, :update], User, id: user.id
#     if user.kind_of? Admin
#       if user.role?('admin')
#       can [:show, :edit, :update], Admin, id: user.id
#       can [:index, :show, :destroy], User
#     elsif user.role?('superadmin')
#       can :manage, :all
#       end
#     end
#   end
# end


class Ability
  # include CanCan::Ability
  
  # # def initialize(user)
  # #   user ||= User.new # guest user
    
  # #   if user.role?('admin')
  # #     can :destroy, User
  # #   elsif user.role? :superadmin
  # #     can :menege, :all
  # #   end
  # # end
end

