class User < ActiveRecord::Base
  ROLE_PAIRS  = { 'administrator' => 'Administrator', 'member' => 'Member' }
  LOCALE_PAIRS = { 'en' => 'English', 'cs' => 'Czech' }
  TIME_ZONE_PAIRS = ActiveSupport::TimeZone::MAPPING

  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :name, :locale, :time_zone, presence: true
  validates :role, inclusion: { in: ROLE_PAIRS.keys }, allow_blank: true
  validates :locale, inclusion: { in: LOCALE_PAIRS.keys }, if: 'locale.present?'
  validates :time_zone, inclusion: { in: TIME_ZONE_PAIRS.keys }, if: 'time_zone.present?'

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
