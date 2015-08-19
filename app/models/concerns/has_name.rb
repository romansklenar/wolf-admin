module HasName
  extend ActiveSupport::Concern

  included do
    alias_method :display_name, :full_name
  end
  
  def full_name
    [first_name, last_name].join(' ').strip if first_name && last_name
  end

  def full_name=(value)
    unless value.blank?
      split = value.split(' ', 2)
      self.first_name = split.first
      self.last_name  = split.last
    end
  end

end
