class Ability
  include CanCan::Ability

	def initialize(user)
	   user ||= User.new # guest user (not logged in)
	    if user.has_role? :admin
	      can :manage, :all
	    elsif user.has_role? :coordinador
	    	can [:create, :update, :show], :all
	    elsif user.has_role? :instructor
	        can [:update, :show], :all
	    elsif user.has_role? :aprendiz
	        can :show, :all
	    else
	        can :show, :all
	    end
	end
end
