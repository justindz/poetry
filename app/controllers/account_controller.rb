class AccountController < ApplicationController
  protect_from_forgery :except => [:login, :open_id_authentication]
  skip_before_filter :require_name_for_user
  
  def login
    @recent_poems = Poem.find(:all, :order => 'created_at desc', :limit => 5)
    
    if logged_in?
      successful_login
    else
      if using_open_id?
        open_id_authentication(params[:openid_url])
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
  end
  
  def canvas
    @recent_poems = Poem.find(:all, :order => 'created_at desc', :limit => 4)
    render :layout => "facebook"
  end
  
  def open_id_authentication(openid_url)
    authenticate_with_open_id(openid_url, :required => [:nickname, :email]) do |result, identity_url, registration|
      if result.successful?
        @user = User.find_or_initialize_by_url(identity_url)
        if @user.new_record?
          @user.name = registration['nickname']
          @user.email = registration['email']
          @user.save(false) # Skip validation - require_name_for_user filter will catch the name and re-direct to profile edit
          u = Url.new
          u.url = identity_url
          u.user = @user
          u.save
        end
        self.current_user = @user
        successful_login
      else
        failed_login
      end
    end
  end
  
  def twitter_authorize
    require 'twitter'
    
    current_user.oauth = Twitter::OAuth.new('ZZ1BhoMhjTMoGqOYt9bIQ', 'h9B13H7K4RDgJAsfN4WEmb5jiFssEmHfjsjOC65B0')
    session['rtoken'] = current_user.oauth.request_token.token
    session['rsecret'] = current_user.oauth.request_token.secret
    
    redirect_to oauth.request_token.authorize_url
  end
  
  def twitter_callback
    oauth = current_user.oauth
    oauth.authorize_from_request(session['rtoken'], session['rsecret'])
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