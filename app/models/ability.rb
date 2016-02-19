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
    elsif user.role? :almoxarifado
      can :manage, StockroomItem
      can :manage, StockroomMovimentation
    else #solicitante
      can :read, :all
    end
  end
end
