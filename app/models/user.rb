class User < ActiveRecord::Base
  include HasName
  include HasImage
  
  TEMP_EMAIL_PREFIX = 'change-me'
  TEMP_EMAIL_REGEX  = /\Achange-me/
  
  ROLE_PAIRS  = { 'administrator' => 'Administrator', 'member' => 'Member' }
  LOCALE_PAIRS = { 'en' => 'English', 'cs' => 'Czech' }
  TIME_ZONE_PAIRS = ActiveSupport::TimeZone::MAPPING

  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable

  has_many :identities, dependent: :destroy
  
  validates :email, format: { without: TEMP_EMAIL_REGEX }, on: :update, unless: :pending_reconfirmation?
  validates :first_name, :last_name, presence: true
  validates :role, inclusion: { in: ROLE_PAIRS.keys }, allow_blank: true, if: 'role.present?'
  with_options unless: :temp_email? do |user|
    user.validates :locale, inclusion: { in: LOCALE_PAIRS.keys }, presence: true
    user.validates :time_zone, inclusion: { in: TIME_ZONE_PAIRS.keys }, presence: true
  end

  attr_accessor :role
  after_save :assign_role, if: 'role.present?'
  
  def self.find_or_create_with_omniauth(auth)
    info = auth.fetch('info')
    where(email: info['email']).first_or_initialize.tap do |user|
      user.email ||= "#{TEMP_EMAIL_PREFIX}@#{auth.uid}-#{auth.provider}.com"
      user.first_name = info['first_name'].presence
      user.last_name  = info['last_name'].presence
      user.full_name  = info['full_name'].presence || info['name'].presence
      user.password   = Devise.friendly_token[0,20]
      user.skip_confirmation!
      user.save!
    end
  end

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
  
  def temp_email?
    email.match(TEMP_EMAIL_REGEX) ? true : false
  end
  
  def incomplete_registration?
    !confirmed? || temp_email? || invalid?
  end
  
  # This method also rejects the password field if it is blank (allowing
  # users to change relevant information like the e-mail without changing
  # their password). In case the password field is rejected, the confirmation
  # is also rejected as long as it is also blank.
  def update_with_password(params, *options)
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    assign_attributes(params, *options) unless update_attributes(params, *options)
    clean_up_passwords
    valid?
  end
end
