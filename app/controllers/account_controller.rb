class AccountController < ApplicationController
  protect_from_forgery :except => [:login, :open_id_authentication]
  skip_before_filter :require_name_for_user
  
  def login
    if using_open_id?
      open_id_authentication(params[:openid_url])
    else
      if logged_in?
        successful_login
      end
      return unless request.post?
      self.current_user = User.authenticate(params[:email], params[:password])
      if logged_in?
        successful_login
      else
        failed_login
      end
    end
  end
  
  def open_id_authentication(openid_url)
    authenticate_with_open_id(openid_url, :required => [:nickname, :email]) do |result, identity_url, registration|
      if result.successful?
        @user = User.find_or_initialize_by_url(identity_url)
        if @user.new_record?
          @user.name = registration['nickname']
          @user.email = registration['email']
          # Skip validation - require_name_for_user filter will catch the name and re-direct to profile edit
          @user.save(false)
        end
        self.current_user = @user
        successful_login
      else
        failed_login
      end
    end
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
  
  private
      # replaced by OpenID support
      def signup
      @user = User.new(params[:user])
      return unless request.post?
      if captcha_valid?(params[:my_super_model][:captcha_id], params[:my_super_model][:captcha_validation])
        @user.save!
        self.current_user = @user
        redirect_back_or_default(:controller => 'users', :action => 'home')
        flash[:notice] = "Thanks for signing up!"
      else
        flash[:error] = "Please try the challenge question again."
        render :action => 'signup'
      end
      rescue ActiveRecord::RecordInvalid
        render :action => 'signup'
      end
end