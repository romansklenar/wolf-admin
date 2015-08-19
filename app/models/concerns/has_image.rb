module HasImage
  extend ActiveSupport::Concern
  
  def image_url
    has_attribute?(:avatar_url) && avatar_url.present? ? avatar_url : gravatar_url
  end

  def gravatar_url(size: 50)
    "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(email.downcase)}.png?d=mm&s=#{size}" if email.present?
  end

end
