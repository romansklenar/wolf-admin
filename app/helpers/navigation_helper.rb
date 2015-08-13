module NavigationHelper

  def nav_link(name = nil, options = nil, html_options = nil, &block)
    html_options, options, name = options, name, block if block_given?
    options ||= {}
    condition = html_options && html_options[:condition]
    
    if condition || (condition == nil && current_page?(options))
      html_options ||= { }
      html_options[:class] = '' unless html_options[:class].present?
      html_options[:class] << ' active'
    end

    link_to(name, options, html_options, &block)
  end

end
