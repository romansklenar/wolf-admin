# These helper methods can be called in your template to set variables to be used in the layout
# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#   helper :layout
module LayoutHelper

  HTTP_EQUIV_ATTRIBUTES = %w[expires pragma content-type content-script-type content-style-type
      default-style content-language refresh window-target cache-control vary x-ua-compatible]

  # Renders a title tag for use in the HEAD section of an html document.
  def title_tag(title)
    content_tag :title, strip_tags(title).strip.html_safe
  end

  # Renders a description meta tag for use in the HEAD section of an html document.
  def description_meta_tag(description)
    meta_tag :description, strip_tags(description).strip.html_safe
  end

  # Renders a keywords meta tag for use in the HEAD section of an html document.
  def keywords_meta_tag(keywords)
    meta_tag :keywords, strip_tags(keywords).strip.html_safe
  end

  # Renders a meta tag for use in the HEAD section of an html document.
  def meta_tag(name, value, http_equiv: nil)
    return nil if value.blank?
    http_equiv = true if http_equiv.nil? && HTTP_EQUIV_ATTRIBUTES.include?(name.downcase)

    if http_equiv
      tag :meta, 'http-equiv' => name, content: value
    else
      tag :meta, name: name, content: value
    end
  end

end
