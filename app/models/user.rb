class User < ActiveRecord::Base
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  attr_accessor :role
  after_save :assign_role, if: 'role.present?'

  def assign_role
    add_role(role) if role.present?
  end
  
  def role
    @role ||= roles.first.name.presence rescue nil
  end

  def ability
    @ability ||= Ability.new(self)
  end

  delegate :can?, :cannot?, to: :ability
end
