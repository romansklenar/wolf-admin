class Ability
  include CanCan::Ability

  attr_accessor :user, :resource, :roles

  # Initialize permissions for resources.
  def initialize(user, resource = nil)
    @user = user || User.new # guest user (not logged in)
    @resource = resource
    @roles = resource.nil? ? @user.roles : @user.roles.where(resource: resource)

    # abilities: read, create, update, destroy, manage, dummy, whatever
    # syntax: can [:update, :destroy], [Article, Comment], { query hash }
    # :manage represents ANY action on object => :manage is not just :create, :read, :update, :destroy on object but really ANY action
    alias_action :update, :destroy, to: :modify
    alias_action :create, :read, :update, :destroy, to: :crud

    role_names = @roles.pluck('DISTINCT roles.name')
    role_names.unshift('guest') unless role_names.include?('guest')
    role_names.each { |role_name| send(role_name) if respond_to?(role_name) }
  end


  # Adjusts permissions for virtual _guest_ role
  def guest
    can :read, ActiveAdmin::Page, name: "Dashboard"
    can [:read, :update], User, id: user.id
  end

  # Adjusts permissions for member_ role
  def member
  end

  # Adjusts permissions for _administrator_ role
  def administrator
    can :manage, :all
  end
end
