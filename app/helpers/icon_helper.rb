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

  def icon_tag(text = nil, html_options = {})
    html = content_tag(:i, nil, html_options)
    html << " #{text}" unless text.blank?
    html.html_safe
  end

end
