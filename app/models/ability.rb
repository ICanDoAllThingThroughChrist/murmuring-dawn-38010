class Ability
  include CanCan::Ability

    # def initialize(user)
    #   user ||= User.new
    #   if user.role? :admin
    #     can :manage, :all
    #   elsif user.role? :subscriber
    #     can :manage, :all
    #   else 
    #     can :read, :all
    #   end
    # end
end
#def initialize(user)
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published Boxs.
    #
    #   can :update, Box, :published => true
    #
    # See the wiki for details:
    # 