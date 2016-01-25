class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? :admin
      can :manage, :all
    elsif user.role? :licitacao
      can :manage, Uasg
      can :manage, Supplier
      can :manage, RequestLog
    else #solicitante
      can :read, :all
    end

  end
end
