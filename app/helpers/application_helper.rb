# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include TagsHelper
  
  def tab(name, controller, view = nil, id = nil)
    "<li>#{ link_to(name, :controller => controller, :action => view, :id => id) }</li>"
  end
  
  def link_to_user(user, id = nil)
    if logged_in?
      (id == current_user.id) ? link_to('You', home_path()) : link_to(user, show_user_path(id))
    else
      link_to(user, show_user_path(id))
    end
  end
  
  def avatar(user, size = nil)
    image_tag(user.avatar.public_filename(), :style => 'vertical-align: middle;', :height => size, :width => size) unless user.avatar.nil?
  end
  
  def mini_avatar(user)
    avatar(user, 24)
  end
end
