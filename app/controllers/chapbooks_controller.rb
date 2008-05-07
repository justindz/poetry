class ChapbooksController < ApplicationController
  before_filter :login_required, :except => [:index, :show, :toc, :intro, :page]
  
  # GET /chapbooks
  # GET /chapbooks.xml
  def index
    @chapbooks = Chapbook.paginate :page => params[:page], :per_page => 10, :order => "created_at DESC"

    respond_to do |format|
      format.html # index.html.erb
      format.rss { render :layout => false } # index.rss.builder
      format.xml  { render :xml => @chapbooks }
    end
  end

  # GET /chapbooks/1
  # GET /chapbooks/1.xml
  def show
    @chapbook = Chapbook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.rss { render :layout => false } # show.rss.builder
      format.xml  { render :xml => @chapbook }
    end
  end
  
  def toc
    @chapbook = Chapbook.find(params[:id])
  end
  
  def intro
    @chapbook = Chapbook.find(params[:id])
  end
  
  def page
    page = Page.find(:first, :conditions => ["sequence = ? AND chapbook_id = ?", params[:sequence], params[:chapbook_id]])
    @poem = page.poem
    @last_page = Page.find(:all, :conditions => ["chapbook_id = ?", params[:chapbook_id]]).size
    @sequence = page.sequence
    @chapbook = Chapbook.find(params[:chapbook_id])
  end

  # GET /chapbooks/new
  # GET /chapbooks/new.xml
  def new
    @chapbook = Chapbook.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chapbook }
    end
  end

  # GET /chapbooks/1/edit
  def edit
    @chapbook = Chapbook.find(params[:id])
  end
  
  # GET /chapbooks/organize/1
  def organize
    @chapbook = Chapbook.find(params[:id])
  end
  
  def tag
    @chapbook = Chapbook.find(params[:chapbook][:id])
    @chapbook.tag_list.add(params[:chapbook][:tags], :parse => true)
    
    if @chapbook.save_tags
      render :update do |page|
        page.replace 'tag_list', :partial => 'poems/tag_list', :locals => { :taggable => @chapbook }
        page.visual_effect :highlight, 'tag_list', :startcolor => '#3399ff', :restorecolor => '#ffffff'
      end
    end
  end

  # POST /chapbooks
  # POST /chapbooks.xml
  def create
    @chapbook = Chapbook.new(params[:chapbook])
    @chapbook.user = current_user

    respond_to do |format|
      if @chapbook.save
        flash[:notice] = "Chapbook was successfully created.  Go find some <a href=\"#{url_for(poems_path())}\">poems to include</a>."
        format.html { redirect_to(@chapbook) }
        format.xml  { render :xml => @chapbook, :status => :created, :location => @chapbook }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chapbook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chapbooks/1
  # PUT /chapbooks/1.xml
  def update
    @chapbook = Chapbook.find(params[:id])

    respond_to do |format|
      if @chapbook.update_attributes(params[:chapbook])
        flash[:notice] = 'Chapbook was successfully updated.'
        format.html { redirect_to(@chapbook) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chapbook.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def upload_cover
    @chapbook = Chapbook.find(params[:chapbook][:id])
    @cover = Cover.new(params[:cover])
    @cover.save
    @chapbook.cover = @cover
    
    if @chapbook.save
      flash[:notice] = "Cover added."
      render :action => "edit"
    else
      flash[:error] = "Cover upload failed."
      render :action => "edit"
    end
  end

  # DELETE /chapbooks/1
  # DELETE /chapbooks/1.xml
  def destroy
    @chapbook = Chapbook.find(params[:id])
    @chapbook.destroy

    respond_to do |format|
      format.html { redirect_to(chapbooks_url) }
      format.xml  { head :ok }
    end
  end
end
