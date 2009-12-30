class AccountController < ApplicationController
  protect_from_forgery :except => [:login]
  
  def login
    @recent_poems = Poem.find(:all, :order => 'created_at desc', :limit => 5)
    
    if logged_in?
      successful_login
    else
      return unless request.post?
      self.current_user = User.authenticate(params[:email], params[:password])
      if logged_in?
        successful_login
      else
        failed_login
      end
    end
  end
  
  def canvas
    @recent_poems = Poem.find(:all, :order => 'created_at desc', :limit => 4)
    render :layout => "facebook"
  end
  
  def successful_login
    if params[:remember_me] == "1"
      self.current_user.remember_me
      cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
    end
    flash[:notice] = "Logged in successfully as #{current_user.name}"
    redirect_back_or_default(:controller => 'users', :action => 'home') and return
  end
  
  def failed_login
    flash[:error] = "Login failed.  Please check your email and password or signup."
  end

  def logout
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default(:controller => 'account', :action => 'login')
  end

  def signup
    return unless request.post?
    
    @user = User.new
    @user.email = params[:user][:email]
    @user.name = params[:user][:name]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    @user.save!

    self.current_user = @user
    redirect_back_or_default(:controller => 'users', :action => 'home')
    flash[:notice] = "Thanks for signing up!"

    rescue ActiveRecord::RecordInvalid
      render :action => 'signup'
  end
end
