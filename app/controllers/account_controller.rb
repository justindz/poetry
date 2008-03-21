class AccountController < ApplicationController
  def login
    if logged_in?
      redirect_back_or_default(:controller => 'users', :action => 'home')
    end
    return unless request.post?
    self.current_user = User.authenticate(params[:email], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      redirect_back_or_default(:controller => 'users', :action => 'home')
      flash[:notice] = "Logged in successfully"
    else
      flash[:error] = "Login failed.  Please check your email and password or signup."
    end
  end

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
    
  
  def logout
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default(:controller => 'account', :action => 'login')
  end
end
