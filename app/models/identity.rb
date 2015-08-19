class Identity < ActiveRecord::Base
  include HasName
  
  PROVIDERS = %w[facebook twitter google_oauth2]

  belongs_to :user

  validates :provider, inclusion: { in: PROVIDERS }, presence: true
  validates :uid, uniqueness: { scope: :provider }, presence: true

  serialize :raw_info, Hash

  def self.find_with_provider(provider)
    where(provider: provider).first
  end

  def self.find_or_create_with_omniauth(auth)
    conditions = auth.slice(:provider, :uid).to_hash
    where(conditions).first_or_initialize.tap do |identity|
      info, credentials, extra = auth.fetch('info'), auth.fetch('credentials'), auth.fetch('extra')

      identity.provider   = auth['provider'].presence
      identity.uid        = auth['uid'].presence
      identity.first_name = info['first_name'].presence
      identity.last_name  = info['last_name'].presence
      identity.full_name  = info['full_name'].presence || info['name'].presence
      identity.email      = info['email'].presence
      identity.token      = credentials['token'].presence || credentials['ticket'].presence
      identity.secret     = credentials['secret'].presence
      identity.raw_info   = extra['raw_info'].to_hash
      identity.save!
    end
  end

  def provider_name
    case provider
      when 'google_oauth2' then 'Google+'
      when 'open_id' then 'OpenID'
      else provider.titleize
    end
  end
end
