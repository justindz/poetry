# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include TagsHelper
  
  def miniflex_tab (name, controller, view = nil, id = nil)
    "<li>#{ link_to(name, :controller => controller, :action => view, :id => id) }</li>"
  end
  
  def link_icon (name, controller, view = nil, id = nil)
    link_to(image_tag(name), { :controller => controller, :action => view, :id => id }, { :class => 'link_icon' })
  end
end
