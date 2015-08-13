module JavascriptHelper
  def javascript_controller_name
    params[:controller].camelize.gsub('::', '.').gsub('Controller', '')
  end

  def javascript_view_name
    action = case params[:action]
      when 'create' then 'new'
      when 'update' then 'edit'
      else params[:action]
    end
    "#{action.camelize}View"
  end

  def javascript_view_class
    "Views.#{javascript_controller_name}.#{javascript_view_name}"
  end
end
