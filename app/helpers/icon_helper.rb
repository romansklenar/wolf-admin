module IconHelper

  def fa_icon(name, options = {})
    options[:class] = "fa fa-#{name} #{options[:class]}".strip
    icon_tag(options.delete(:text), options)
  end

  def ion_icon(name, options = {})
    options[:class] = "ion-#{name} #{options[:class]}".strip
    icon_tag(options.delete(:text), options)
  end

  def glyph_icon(name, options = {})
    options[:class] = "glyphicon glyphicon-#{name} #{options[:class]}".strip
    icon_tag(options.delete(:text), options)
  end

  def icon_tag(text = nil, options = {})
    reverse = options.delete(:reverse).presence
    icon = content_tag(:i, nil, options)
    
    if text.blank?
      icon
    else
      elements = [icon, text]
      elements.reverse! if reverse
      elements.join(" ").html_safe
    end
  end

end
