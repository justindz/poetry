class UsersController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  
  # GET /users
  # GET /users.xml
  def index
    @users = User.find(:all)
 
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
 
  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    @tags = @user.poems.tag_counts
 
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  def dashboard
    @user = current_user
  end
 
  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
 
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end
   
  def favorite
    @favorite = Favorite.new
    @favorite.poem_id = params[:id]
    @favorite.user_id = current_user
    
    if @favorite.save
      render :update do |page|
        page.hide 'favorite'
        page.show 'favorited'
        page.visual_effect :highlight, 'favorited', :startcolor => '#3399ff', :restorecolor => '#ffffff'
      end
    end
  end
  
  def remove_favorite
    @favorite = current_user.find_favorite(params[:id])
    if @favorite.destroy
      render :update do |page|
        page.hide 'favorited'
        page.show 'favorite'
        page.visual_effect :highlight, 'favorite', :startcolor => '#3399ff', :restorecolor => '#ffffff'
      end
    end
  end
  
  def request_friend
    @friend = User.find(params[:id])
    
    if current_user.request_friendship_with(@friend)
      render :update do |page|
        page.hide 'request_friend'
        page.insert_html :after, 'request_friend', '<span id="friend_requested">Friendship is pending with ' + @friend.name + '.</span>'
        page.visual_effect :highlight, 'friend_requested'
      end
    end
  end
  
  def approve_friend_request
    @friend = User.find(params[:id])
    
    if current_user.accept_friendship_with(@friend)
      render :update do |page|
        page.visual_effect(:BlindUp, "pending_request" + @friend.id.to_s)
        page.insert_html(:bottom, 'friends', '<li id="friend' + @friend.id.to_s + '" style="display: none;">' + link_to(@friend.name, { :controller => 'users', :action => 'show', :id => @friend }) + '</li>')
        page.visual_effect(:BlindDown, "friend" + @friend.id.to_s)
      end
    end
  end
  
  def cancel_friend_request
    @friend = User.find(params[:id])
    
    if current_user.is_pending_friends_with?(@friend)
      current_user.delete_friendship_with @friend
      
      render :update do |page|
        page.visual_effect(:SwitchOff, "pending_request" + @friend.id.to_s)
      end
    end
  end
  
  def remove_friendship
    @friend = User.find(params[:id])
    
    if current_user.is_friends_with?(@friend)
      current_user.delete_friendship_with @friend
      
      render :update do |page|
        page.visual_effect(:Squish, "friend" + @friend.id.to_s)
      end
    end
  end
 
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end
 
  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:word])
 
    respond_to do |format|
      if @user.save
        flash[:notice] = 'User was successfully created.'
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
 
  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
 
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
 
  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy
 
    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end