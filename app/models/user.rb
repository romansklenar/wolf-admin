class User < ActiveRecord::Base
  ROLES = %w[administrator member]
  LOCALES = %w[en]
  TIME_ZONES = ActiveSupport::TimeZone::MAPPING.keys
  
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :name, :locale, :time_zone, presence: true
  validates :role, inclusion: { in: ROLES }, allow_blank: true
  validates :locale, inclusion: { in: LOCALES }, if: 'locale.present?'
  validates :time_zone, inclusion: { in: TIME_ZONES }, if: 'time_zone.present?'

  attr_accessor :role
  after_save :assign_role, if: 'role.present?'

  def assign_role
    add_role(role) if role.present?
  end
  
  def role
    @role ||= roles.last.name.presence rescue nil
  end

  def ability
    @ability ||= Ability.new(self)
  end

  delegate :can?, :cannot?, to: :ability
end
