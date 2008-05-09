# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

require 'login_system'
# NOTE: Diff module loaded in config -> initializers -> local.rb

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include AuthenticatedSystem
  
  before_filter :login_from_cookie
  before_filter :require_name_for_user
  
  def require_name_for_user
    if logged_in? && current_user.name.nil?
      flash[:notice] = "You need to provide a name so we can tell people who wrote your seminal works."
      redirect_to(edit_user_url(current_user)) and return
    end
  end

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '307b8a34c931d02b46ef87ce7449305c'
end
