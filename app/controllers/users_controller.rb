class UsersController < ApplicationController
  skip_before_filter :require_name_for_user, :only => [:edit, :update, :add_openid]
  before_filter :login_required, :except => [:index, :show, :favorites]

  # GET /users/home
  # GET /users/home.xml
  def home
    @user = current_user
    @my_recent_poems = Poem.find(:all, :order => 'created_at desc', :limit => 5, :conditions => ["user_id = ?", @user.id])
    @recent_poems = Poem.find(:all, :order => 'created_at desc', :limit => 5, :conditions => ["user_id != ?", @user.id])
    
    respond_to do |format|
      format.html # home.html.erb
    end
  end
 
  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    @tags = @user.poems.tag_counts
    @poems = Poem.find(:all, :order => 'created_at desc', :limit => 5, :conditions => ["user_id = ?", @user.id])
 
    respond_to do |format|
      format.html # show.html.erb
      format.rss { render :layout => false } # show.rss.builder
      format.rdf { render :layout => false } # show.rdf.builder
      format.xml  { render :xml => @user }
    end
  end
  
  # GET /users/1/all
  def all
    @user = User.find(params[:id])
    @poems = @user.poems.paginate(:page => params[:page], :per_page => 10, :order => 'created_at desc')
    
    respond_to do |format|
      format.html # all.html.erb
    end
  end
  
  def favorites
    @user = User.find(params[:id])
    @favorites = @user.favorites
    
    respond_to do |format|
      format.html # favorites.html.erb
      format.rss { render :layout => false } # favorites.rss.builder
      format.xml { render :xoml => @favorites }
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
        page.insert_html(:bottom, 'friends', '<li id="friend' + @friend.id.to_s + '">' + mini_avatar(@friend) + link_to(@friend.name, user_path(@friend)) + '</li>')
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
        format.html { redirect_to(home_url()) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def add_openid
    @user = User.find(params[:id])
    @oid = Url.new
    @oid.url = params[:url]
    @oid.user = @user
    if @oid.save
      flash[:notice] = "New OpenID URL added."
    else
      flash[:error] = "OpenID authentication failed.  Verify the URL and ensure the provider is available, then try again."
    end
    render :action => "edit"
  end
  
  def upload_avatar
    @user = User.find(params[:user][:id])
    @avatar = Avatar.new(params[:avatar])
    @avatar.save
    @user.avatar = @avatar
    
    if @user.save
      flash[:notice] = "Avatar added."
      render :action => "edit"
    else
      flash[:error] = "Avatar upload failed."
      render :action => "edit"
    end
  end
  
  def download
    require 'zip/zip'
    
    filename = File.join RAILS_ROOT, 'public', 'archives', current_user.id.to_s + '.zip'
    File.delete(filename) if File.file?(filename)

    Zip::ZipOutputStream.open(filename) do |zipfile|
      current_user.poems.each do |poem|
        entry = zipfile.put_next_entry(poem.id.to_s + '.txt')
        zipfile.puts poem.title
        zipfile.puts '\n'
        zipfile.puts poem.body
      end
    end
    
    redirect_to('/archives/' + current_user.id.to_s + '.zip')
  end
 
  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    if current_user == @user
      @user.destroy
 
      respond_to do |format|
        format.html { redirect_to(users_url) }
        format.xml  { head :ok }
      end
    else
      flash[:error] = "Naughty naughty.  You can't delete other people."
    end
  end
end