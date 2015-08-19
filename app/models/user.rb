class User < ActiveRecord::Base
  ROLE_PAIRS  = { 'administrator' => 'Administrator', 'member' => 'Member' }
  LOCALE_PAIRS = { 'en' => 'English', 'cs' => 'Czech' }
  TIME_ZONE_PAIRS = ActiveSupport::TimeZone::MAPPING

  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :identities, dependent: :destroy

  validates :name, :locale, :time_zone, presence: true
  validates :role, inclusion: { in: ROLE_PAIRS.keys }, allow_blank: true, if: 'role.present?'
  validates :locale, inclusion: { in: LOCALE_PAIRS.keys }, if: 'locale.present?'
  validates :time_zone, inclusion: { in: TIME_ZONE_PAIRS.keys }, if: 'time_zone.present?'

  attr_accessor :role
  after_save :assign_role, if: 'role.present?'
  
  def self.find_or_create_with_omniauth(info)
    where(email: info['email']).first_or_create! do |record|
      record.first_name = info['first_name']
      record.last_name = info['last_name']
      record.password = Devise.friendly_token[0,20]
    end
  end
  
  alias_attribute :display_name, :name

  def assign_role
    add_role(role) if role.present?
  end
  
  def role=(value)
    @role = value.to_s.presence
  end

  def role
    @role ||= roles.last.name.presence rescue nil
  end

  def ability
    @ability ||= Ability.new(self)
  end

  delegate :can?, :cannot?, to: :ability
end
