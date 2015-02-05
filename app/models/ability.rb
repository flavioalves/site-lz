class Ability
  include CanCan::Ability

    def initialize(user)
        user ||= User.new # guest user (not logged in)
        can :read, Client, id: user.client_id
        can :read, Project do |project|
            project.users.include?(user)
        end
    end   
end
