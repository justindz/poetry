# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include TagsHelper
  
  def miniflex_tab (name, controller, view = nil, id = nil)
    "<li>#{ link_to(name, :controller => controller, :action => view, :id => id) }</li>"
    # class="active" for active tab
  end
end
