class PoemsController < ApplicationController
  before_filter :login_required, :except => [:index, :show, :about, :compare]
  protect_from_forgery :except => :create
  
  def about
  end
  
  # GET /poems
  # GET /poems.xml
  def index
    @poems = Poem.paginate :page => params[:page], :per_page => 10, :order => "created_at DESC"
    @tags = Poem.tag_counts

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @poems }
    end
  end

  # GET /poems/1
  # GET /poems/1.xml
  def show
    @poem = Poem.find(params[:id])
    Poem.viewed(current_user, @poem)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @poem }
    end
  end
  
  def tag
    @poem = Poem.find(params[:poem][:id])
    @poem.tag_list.add(params[:poem][:tags], :parse => true)
    
    if @poem.save_tags
      render :update do |page|
        page.replace 'tag_list', :partial => 'tag_list', :locals => { :taggable => @poem }
        page.visual_effect :highlight, 'tag_list', :startcolor => '#3399ff', :restorecolor => '#ffffff'
      end
    end
  end
  
  def add_to_chapbook
    @poem = Poem.find(params[:poem_id])
    @chapbook = Chapbook.find(params[:chapbook_id])
    
    if @chapbook.poems.push(@poem)
      render :update do |page|
        page.hide 'add_to_chapbook'
        page.replace 'chapbook_membership_list', :partial => 'poems/chapbook_membership', :object => @poem
        page.visual_effect :highlight, 'chapbook_membership_list', :startcolor => '#3399ff', :restorecolor => '#ffffff'
      end
    end
  end
  
  def compare
    if params[:poem_id]
      @poem = Poem.find(params[:poem_id])
      @revision = Revision.find(params[:revision_id])
    else
      @poem = Revision.find(params[:revision].keys[0])
      @revision = Revision.find(params[:revision].keys[1])
    end
    
    render :update do |page|
      page.replace 'comparison', :partial => 'comparison', :locals => { :poem => @poem, :rev => @revision }
      page.visual_effect :highlight, 'comparison', :startcolor => '#ee99ff', :restorecolor => '#ffffff'
    end
  end

  # GET /poems/new
  # GET /poems/new.xml
  def new
    @poem = Poem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @poem }
    end
  end

  # PUT /poems/1
  def update
    @poem = Poem.find(params[:poem][:id])
    @poem.save_revision
    
    if @poem.update_attributes(params[:poem])
      render :update do |page|
        page.replace 'poem', :partial => 'poem', :object => @poem
        page.hide 'edit_poem'
        page.show 'poem'
        page.visual_effect :highlight, 'poem'
        page.replace 'poem_history', :partial => 'poem_history', :object => @poem
        page.visual_effect :highlight, 'poem_history'
        page.replace_html 'revision_count', pluralize(@poem.revisions.count, 'time')
        page.visual_effect :highlight, 'revision_count'
      end
    end
  end

  # POST /poems
  # POST /poems.xml
  def create
    if request.xhr?
      @poem = Poem.new
      params[:title].empty? ? @poem.title = 'Untitled' : @poem.title = params[:title]
      @poem.body = params[:body]
      @poem.user = current_user
    else
      @poem = Poem.new(params[:poem])
    end

    respond_to do |format|
      if @poem.save
        flash[:notice] = 'Poem was successfully created.'
        format.html { redirect_to(@poem) }
        format.xml  { render :text => poem_url(@poem) }
      else
        flash[:error] = "Problem: #{@poem.errors}"
        format.html { render :action => "new" }
        format.xml  { render :xml => @poem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /poems/1
  # DELETE /poems/1.xml
  def destroy
    @poem = Poem.find(params[:id])
    @poem.destroy

    respond_to do |format|
      format.html { redirect_to(poems_url) }
      format.xml  { head :ok }
    end
  end
end
